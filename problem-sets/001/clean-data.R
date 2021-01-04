
# Setup ----------------------------------------------------------------------------------
	# Load packages
	library(pacman)
	p_load(tidyverse, haven, data.table, broom, magrittr, here)

# Load data ------------------------------------------------------------------------------
	# Load data
	acs_raw = here("acs-pull.dta") %>% read_dta()
	# Grab variable labels
	var_desc = lapply(acs_raw, function(x) attributes(x)$label)
	# Convert data into data table
	acs_raw %<>% setDT()
	# Find movers
	acs_raw[, i_moved := 1L * (migrate1 %in% 2:4)]
	# Add household-level race and commuting
	acs_raw[, `:=`(
		i_moved = max(i_moved),
		n_white = sum(race == 1),
		n_nonwhite = sum(race != 1),
		time_commuting = 2 * mean(trantime)
	), by = serial]
	# Grab (and transform) desired variables
	acs_clean = acs_raw[, .(
		fips = paste0(str_pad(statefip, 2, "left", 0), str_pad(countyfip, 3, "left", 0)),
		hh_size = n_white + n_nonwhite,
		hh_income = hhincome,
		cost_housing = mortamt1 + rent,
		n_vehicles = vehicles,
		hh_share_nonwhite = n_nonwhite / (n_white + n_nonwhite),
		i_renter = 1L * (rent > 0),
		i_moved,
		i_foodstamp = foodstmp,
		i_smartphone = cismrtphn,
		i_internet = cinethh,
		time_commuting = time_commuting
	)] %>% unique()
	# Drop observations missing values
	acs_clean = acs_clean[!(
		str_detect(hh_income, "^999") | (hh_income == 0) |
		str_detect(cost_housing, "^999") | (cost_housing == 0) |
		(n_vehicles == 0) |
		(i_foodstamp == 0) |
		(i_smartphone == 0) |
		(i_internet == 0)
	)]
	# Fix 'n_vehicles'
	acs_clean[n_vehicles == 9, n_vehicles := 0]
	# Fix 'i_foodstamp'
	acs_clean[, i_foodstamp := 1L * (i_foodstamp == 2)]
	# Fix 'i_smartphone'
	acs_clean[, i_smartphone := 1L * (i_smartphone == 1)]
	# Fix 'i_internet'
	acs_clean[, i_internet := 1L * (i_internet %in% 1:2)]
	# Adjust HH income to 10Ks
	acs_clean[, hh_income := hh_income / 1e4]
	# Subset to folks with positive income and positive commuting time
	acs_clean = acs_clean[time_commuting > 0 & hh_income > 0]
	# Grab sample
	set.seed(123)
	acs_sub = sample_n(acs_clean, 2.5e4) %T>% setDT()
	# Save subset
	readr::write_rds(
		acs_sub,
		"001-data.rds"
	)
	readr::write_csv(
		acs_sub,
		"001-data.csv"
	)

# Assignment -----------------------------------------------------------------------------
	# Linear: Income
	lm(
		time_commuting ~ hh_income,
		data = acs_sub
	) %>% tidy()
	# Log-linear
	lm(
		log(time_commuting) ~ hh_income,
		data = acs_sub
	) %>% tidy()
	# Log-log
	lm(
		log(time_commuting) ~ log(hh_income),
		data = acs_sub
	) %>% tidy()
	# Indicators
	lm(	
		time_commuting ~ i_moved + hh_share_nonwhite,
		data = acs_sub
	) %>% tidy()
	# Add interaction between moved and share nonwhite
	lm(	
		time_commuting ~ i_moved * hh_share_nonwhite,
		data = acs_sub
	) %>% tidy()
	# Indicator as outcome
	lm(
		i_smartphone ~ hh_income,
		data = acs_sub
	) %>% tidy()
	# Add ethnicity
	lm(
		i_smartphone ~ hh_income + hh_share_nonwhite,
		data = acs_sub
	) %>% tidy()
	# Interaction
	lm(
		i_smartphone ~ hh_income * hh_share_nonwhite,
		data = acs_sub
	) %>% tidy()
	# Omitted variables?