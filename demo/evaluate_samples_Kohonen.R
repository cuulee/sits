# satellite image time series package (SITS)
# example of clustering using self-organizin maps
library(sits)
library(kohonen)

data.tb <- data("samples_mt_9classes")
data.tb <- samples_mt_9classes

#Get time series
time_series.ts <- sits_values(data.tb, format = "bands_cases_dates")

##To use the DTW distance
#sourceCpp(paste(path.package("sits"), "inst/Distances/distance.cpp", sep = "/"))

#Create cluster with Self-organizing maps (kohonen)
koh <-
    sits::sits_kohonen(
        data.tb,
        time_series.ts,
        grid_xdim = 25,
        grid_ydim = 25,
        rlen = 100,
        dist.fcts = "euclidean",
        neighbourhood.fct = "gaussian"
    )

#Analyze the mixture between groups and extract informations about confusion matrix
confusion_by_cluster <- sits_metrics_by_cluster(koh$info_samples)
confusion_matrix <- confusion_by_cluster$confusion_matrix
sits_plot_cluster_info(confusion_by_cluster, "Confusion by Cluster")

#Divide groups according to variations
subgroups <- sits_subgroup(koh)

#Get samples tibble with subgroups
samples_subgroup <- subgroups$samples_subgroup.tb

#Get neurons and their patterns
neurons_subgroup <- subgroups$neurons_subgroup.lst

#Number of subgroups for each class
number_of_subgroup <- lengths(neurons_subgroup)

#Plot subgroups
sits_plot_subgroups(neurons_subgroup)

