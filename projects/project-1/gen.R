
# Setup ----------------------------------------------------------------------------------
	# Packages
	library(pacman)
	p_load(tidyverse, magrittr, here)

# Generate data --------------------------------------------------------------------------
	# Set seed
	set.seed(123456)
	# Sample size
	n = 1e4
	# Generate data
	gen_df = tibble(
		# person = 1:n,
		female = sample(c(1,0), size = n, replace = T),
		nonwhite = sample(c(1,0), size = n, replace = T, prob = c(0.61, 0.39)),
		ability = runif(n, max = 100) %>% as.integer(),
		drive = runif(n, max = 100) %>% as.integer(),
		education = case_when(
			ability < 70 ~ rnorm(n, mean = 10, sd = 3),
			ability >= 70 ~ rnorm(n, mean = 15, sd = 4),
			(ability > 95) & (drive > 90) ~ rnorm(n, mean = 20, sd = 3)
		) %>% add(1 * female - 2 * nonwhite) %>% round(0)
	)
	gen_df %<>% mutate(
		education = case_when(
			between(education, 9, 12) & (drive > 75) ~ 12,
			between(education, 14, 16) & (drive > 85) ~ 16,
			TRUE ~ education
		)
	)
	# Other variables
	gen_df %<>% mutate(
		urban = sample(c(1,0), size = n, replace = T),
		married = sample(c(1,0), size = n, replace = T),
		kids = sample(c(0:4), size = n, replace = T, prob = c(0.6, 0.15, 0.15, 0.05, 0.05))
	)
	# Create income outcome
	gen_df %<>% mutate(
		income = 1e4 + exp(
			2 + 
			0.4 * (ability/100) + 
			0.2 * (drive/100) + 
			0.7 * education + 
			(-0.10) * female + 
			(-0.10) * nonwhite +
			(-0.05) * (female == 0) * nonwhite +
			(-0.05) * (female) * (education) +
			30 * rbeta(n, shape1 = 2, shape2 = 50)
		)
	)
	gen_df %<>% mutate(income = income %>% round(2))
	# Drop observations above some percentile
	gen_df %<>% filter(income <= quantile(income, 0.85))
	# Keep 5,000 observations
	gen_df %<>% sample_n(5e3)
	# Drop 'drive'
	gen_df %<>% select(-drive)
	# Re-order variables
	gen_df %<>% select(income, married, kids, nonwhite, female, education, urban, ability)
	# Save
	write_csv(gen_df, "proj1.csv")


