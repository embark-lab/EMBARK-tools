
#Creates Demographic and Eating Disorder Dataset. Note - only needs to be run when Cleaned data is updated

library(dplyr)
library(cgwtools)

#create joined dataset
load('data/ALSPAC_Cleaned.RData')
binge_comp <- full_join(binge_eating, compensatory_behaviors)
ed_behaviors <- full_join(binge_comp, driven_exercise)
ed_cog_beh <-full_join(ed_behaviors, ed_cognitions)
demo_ed <-full_join(ed_cog_beh, demographics)
save(demo_ed, file = 'data/ed_data.RData')

#create dataset with at least one ED timepoint
demo_ed.f <- demo_ed %>%
  filter_at(vars(ends_with(c('.14', '.16', '.18', '.24'))), any_vars(!is.na(.)))

#create long dataset
demo_ed.l <- demo_ed %>%
  pivot_longer(cols = ends_with(c(".14", ".16", ".18", ".24")),
               names_sep = "\\.",
               names_to = c(".value", "age")
  )

#creates long version of the filtered data
demo_ed.lf <- demo_ed.f %>%
  pivot_longer(cols = ends_with(c(".14", ".16", ".18", ".24")),
               names_sep = "\\.",
               names_to = c(".value", "age")
  )


resave(demo_ed.l, file = 'data/ed_data.RData' )
resave(demo_ed.f, file = 'data/ed_data.RData' )
resave(demo_ed.lf, file = 'data/ed_data.RData' )

rm(list = ls())

