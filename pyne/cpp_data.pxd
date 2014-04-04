"""C++ wrapper for data library."""
from libcpp.string cimport string as std_string
from libcpp.map cimport map
from libcpp.set cimport set
from libcpp.utility cimport pair
from libcpp cimport bool
from libcpp.vector cimport vector

cimport extra_types

cdef extern from "data.h" namespace "pyne":
    # Mathematical constants
    double pi
    double N_A
    double barns_per_cm2
    double cm2_per_barn
    double sec_per_day

    # hash map and initialization function
    map[std_string, std_string] data_checksums
    
    # atomic_mass functions
    map[int, double] atomic_mass_map
    double atomic_mass(int) except +
    double atomic_mass(char *) except +
    double atomic_mass(std_string) except +

    # natural_abund functions
    map[int, double] natural_abund_map
    double natural_abund(int) except +
    double natural_abund(char *) except +
    double natural_abund(std_string) except +

    # q_val functions
    map[int, double] q_val_map
    double q_val(int) except +
    double q_val(char *) except +
    double q_val(std_string) except +

    map[int, double] gamma_frac_map
    double gamma_frac(int) except +
    double gamma_frac(char *) except +
    double gamma_frac(std_string) except +

    # ext_air_df functions
    map[int, double] ext_air_df_map
    pair[double, double] ext_air_df(int) except +
    pair[double, double] ext_air_df(char *) except +
    pair[double, double] ext_air_df(std_string) except +

    # ext_soil_df functions
    map[int, double] ext_soil_df_map
    double ext_soil_df(int) except +
    double ext_soil_df(char *) except +
    double ext_soil_df(std_string) except +

    # ingest_df functions
    map[int, double] ingest_df_map
    pair[double, double] ingest_df(int) except +
    pair[double, double] ingest_df(char *) except +
    pair[double, double] ingest_df(std_string) except +

    # inhale_df functions
    map[int, double] inhale_df_map
    pair[double, string] inhale_df(int) except +
    pair[double, string] inhale_df(char *) except +
    pair[double, string] inhale_df(std_string) except +

    # Scattering length functions
    map[int, extra_types.complex_t] b_coherent_map
    extra_types.complex_t b_coherent(int) except +
    extra_types.complex_t b_coherent(char *) except +
    extra_types.complex_t b_coherent(std_string) except +

    map[int, extra_types.complex_t] b_incoherent_map
    extra_types.complex_t b_incoherent(int) except +
    extra_types.complex_t b_incoherent(char *) except +
    extra_types.complex_t b_incoherent(std_string) except +

    map[int, double] b_map
    double b(int) except +
    double b(char *) except +
    double b(std_string) except +

    # fission product data
    map[pair[int, int], double] wimsdfpy_data
    double fpyield(pair[int, int], int, bool) except +
    double fpyield(int, int, int, bool) except +
    double fpyield(char *, char *, int, bool) except +
    double fpyield(std_string, std_string, int, bool) except +

    # decay data functions
    map[int, double] half_life_map
    double half_life(int) except +
    double half_life(char *) except +
    double half_life(std_string) except +

    map[int, double] decay_const_map
    double decay_const(int) except +
    double decay_const(char *) except +
    double decay_const(std_string) except +

    map[pair[int, int], double] branch_ratio_map
    double branch_ratio(pair[int, int]) except +
    double branch_ratio(int, int) except +
    double branch_ratio(char *, char *) except +
    double branch_ratio(std_string, std_string) except +

    map[int, double] state_energy_map
    double state_energy(int) except +
    double state_energy(char *) except +
    double state_energy(std_string) except +

    map[int, set[int]] decay_children_map
    set[int] decay_children(int) except +
    set[int] decay_children(char *) except +
    set[int] decay_children(std_string) except +

    int metastable_id(int, int) except +
    int metastable_id(int) except +

    #ENSDF data functions
    pair[double,double] decay_half_life(pair[int, int]) except +
    vector[pair[double, double]] decay_half_lifes(int) except +
    double decay_branch_ratio(pair[int, int] from_to) except +
    vector[double] decay_branch_ratios(int) except +
    pair[double,double] decay_photon_branch_ratio(pair[int, int] from_to) except +
    vector[pair[double, double]] decay_photon_branch_ratios(int) except +
    pair[double,double] decay_beta_branch_ratio(pair[int, int] from_to) except +
    vector[pair[double, double]] decay_beta_branch_ratios(int) except +

    vector[pair[double, double]] gamma_energy(int parent) except +
    vector[pair[double, double]] gamma_photon_intensity(int parent) except +
    vector[pair[double, double]] gamma_conversion_intensity(int parent) except +
    vector[pair[double, double]] gamma_total_intensity(int parent) except +
    vector[pair[int, int]] gamma_from_to(int parent) except +
    vector[pair[int, int]] gamma_from_to(double energy, double error) except +
    vector[int] gamma_parent(double energy, double error) except +
    
    vector[double] alpha_energy(int parent) except +
    vector[double] alpha_intensity(int parent) except +
    vector[int] alpha_parent(double energy, double error) except +
    vector[int] alpha_child(double energy, double error) except +
    vector[int] alpha_child(int parent) except +

    vector[double] beta_endpoint_energy(int parent) except +
    vector[double] beta_average_energy(int parent) except +
    vector[double] beta_intensity(int parent) except +
    vector[int] beta_parent(double energy, double error) except +
    vector[int] beta_child(double energy, double error) except +
    vector[int] beta_child(int parent) except +

    vector[double] ecbp_endpoint_energy(int parent) except +
    vector[double] ecbp_average_energy(int parent) except +
    vector[double] ec_intensity(int parent) except +
    vector[double] bp_intensity(int parent) except +
    vector[int] ecbp_parent(double energy, double error) except +
    vector[int] ecbp_child(double energy, double error) except +
    vector[int] ecbp_child(int parent) except +
