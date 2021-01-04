

# Setup ----------------------------------------------------------------------------------
	# Load packages
	library(pacman)
	p_load(janitor, data.table, lubridate, magrittr, here)


# Data: Emissions and generation ---------------------------------------------------------
	# Find files
	files = here("data_raw", "epa_emissions") %>%
	dir(full.names = T, pattern = "Y20[0-9]{2}DailyData.csv")
	gen_dt = lapply(
		X = files,
		FUN = function(f) {
			# Read data
			f_dt = fread(f)
			# Clean names
			setnames(f_dt, f_dt[0] %>% clean_names() %>% names())
			# Standardize units of generation
			f_dt[, daily_generation_uom := tolower(daily_generation_uom)]
		  f_dt[, gen_mwh := daily_generation]
		  f_dt[daily_generation_uom == "klbhr", `:=`(
		    gen_mwh = as.integer(gen_mwh * 1203.3 / 10300)
	  	)]
		  f_dt[daily_generation_uom == "mmbtuhr", `:=`(
		    gen_mwh = as.integer(gen_mwh * 1e3 / 10300)
		  )]
		  # Dates
		  f_dt[, month := mdy(op_date) %>% floor_date("month")]
		  # Aggregate
		  f_dt[, .(
		  	generation_gwh = sum(gen_mwh, na.rm = T) / 1e3,
		  	emissions_so2 = sum(daily_so2_mass_tons, na.rm = T),
		  	emissions_nox = sum(daily_n_ox_mass_tons, na.rm = T),
		  	n_plants = uniqueN(unique_id)
		  ), by = month]
		}
	) %>% rbindlist()


# Data: Retirements and abatement --------------------------------------------------------
	# Load data
	plant_dt = here("data_raw", "epa_emissions", "PlantInfo(2005-2019).csv") %>% fread()
	# Clean names
	setnames(plant_dt, plant_dt[0] %>% clean_names() %>% names())
	# Find retirements
	ret_dt = plant_dt[unit_retired_date != "", .(
		date = unit_retired_date,
		key_unit_id
	)] %>% unique()
	ret_dt = ret_dt[, .(
		n_retirements = .N
	), by = .(month = date %>% dmy() %>% floor_date("month"))]

# Data: Merge ----------------------------------------------------------------------------	
	# Merge datasets
	gen_dt %<>% merge(y = ret_dt, by = "month", all.x = T, all.y = F)
	# Fill in retirements
	gen_dt[is.na(n_retirements), n_retirements := 0]
	# Cumulative retirements
	setorder(gen_dt, month)
	gen_dt[, cumulative_retirements := cumsum(n_retirements)]
	# Add time
	gen_dt[, t := 1:.N]
	# Set column order
	setcolorder(gen_dt, c(
		"t", "month",
		"generation_gwh", "emissions_so2", "emissions_nox", "n_plants",
		"n_retirements", "cumulative_retirements"
	))
	# Add programs
	gen_dt[, i_cair := as.numeric(year(month) %>% between(2010, 2014))]
	gen_dt[, i_csapr := as.numeric(year(month) > 2014)]

# Save data ------------------------------------------------------------------------------
	# Save data
	fwrite(gen_dt, "~/Desktop/003-data.csv")