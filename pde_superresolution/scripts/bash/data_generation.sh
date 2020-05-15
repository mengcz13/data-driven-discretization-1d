#!/bin/bash

# CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_training_data.py --output_path data/piml/burgers_t4_train.h5 --equation_name burgers --num_tasks 1 --equation_kwargs "{\"k_min\": 3, \"num_points\": 512, \"eta\": 0.1, \"mu\": 1.0, \"k_max\": 6, \"init_value_func_name\": \"sin\", \"with_forcing\": false}" --time_max 0.67 --time_delta 0.005
# CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_exact_data.py --output_path data/piml/burgers_t4_test.nc --equation_name burgers --num_samples 1 --equation_kwargs "{\"k_min\": 3, \"num_points\": 512, \"eta\": 0.1, \"mu\": 1.0, \"k_max\": 6, \"init_value_func_name\": \"sin\", \"with_forcing\": false}" --time_max 0.33 --time_delta 0.005 --warmup 0.67

# CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_training_data.py --output_path data/piml/burgers_t5_train.h5 --equation_name burgers --num_tasks 1 --equation_kwargs "{\"k_min\": 3, \"num_points\": 512, \"eta\": 0.07, \"mu\": 1.5, \"k_max\": 6, \"init_value_func_name\": \"sin\", \"with_forcing\": false}" --time_max 0.67 --time_delta 0.005
# CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_exact_data.py --output_path data/piml/burgers_t5_test.nc --equation_name burgers --num_samples 1 --equation_kwargs "{\"k_min\": 3, \"num_points\": 512, \"eta\": 0.07, \"mu\": 1.5, \"k_max\": 6, \"init_value_func_name\": \"sin\", \"with_forcing\": false}" --time_max 0.33 --time_delta 0.005 --warmup 0.67

# CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_training_data.py --output_path data/piml/burgers_t6_train.h5 --equation_name burgers --num_tasks 1 --equation_kwargs "{\"k_min\": 3, \"num_points\": 512, \"eta\": 0.1, \"mu\": 1.0, \"k_max\": 6, \"init_value_func_name\": \"sin_exp\", \"with_forcing\": false}" --time_max 0.67 --time_delta 0.005
# CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_exact_data.py --output_path data/piml/burgers_t6_test.nc --equation_name burgers --num_samples 1 --equation_kwargs "{\"k_min\": 3, \"num_points\": 512, \"eta\": 0.1, \"mu\": 1.0, \"k_max\": 6, \"init_value_func_name\": \"sin_exp\", \"with_forcing\": false}" --time_max 0.33 --time_delta 0.005 --warmup 0.67

# CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_training_data.py --output_path data/piml/burgers_t7_train.h5 --equation_name burgers --num_tasks 1 --equation_kwargs "{\"k_min\": 3, \"num_points\": 512, \"eta\": 0.07, \"mu\": 1.5, \"k_max\": 6, \"init_value_func_name\": \"sin_exp\", \"with_forcing\": false}" --time_max 0.67 --time_delta 0.005
# CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_exact_data.py --output_path data/piml/burgers_t7_test.nc --equation_name burgers --num_samples 1 --equation_kwargs "{\"k_min\": 3, \"num_points\": 512, \"eta\": 0.07, \"mu\": 1.5, \"k_max\": 6, \"init_value_func_name\": \"sin_exp\", \"with_forcing\": false}" --time_max 0.33 --time_delta 0.005 --warmup 0.67


# Meta-test training data: 0.25 < abs(A) <= 0.5, 0.2 < abs(omega) <= 0.4, l <- [5, 6]
# 67 steps, warmup 10
CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_training_data.py --output_path data/piml/burgers_meta-test_train.h5 --equation_name burgers --num_tasks 10 --equation_kwargs "{\"num_points\": 512, \"eta\": 0.1, \"mu\": 1.0, \"k_min\": 5, \"k_max\": 6, \"abs_a_min\": 0.25, \"abs_a_max\": 0.5, \"abs_omega_min\": 0.2, \"abs_omega_max\": 0.4}" --time_max 67 --time_delta 0.1 --warmup 10

# Meta-test test data: 0.25 < abs(A) <= 0.5, 0.2 < abs(omega) <= 0.4, l <- [5, 6]
# 100 steps, warmup 10
CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_exact_data.py --output_path data/piml/burgers_meta-test_test.nc --equation_name burgers --num_samples 10 --equation_kwargs "{\"num_points\": 512, \"eta\": 0.1, \"mu\": 1.0, \"k_min\": 5, \"k_max\": 6, \"abs_a_min\": 0.25, \"abs_a_max\": 0.5, \"abs_omega_min\": 0.2, \"abs_omega_max\": 0.4}" --time_max 100 --time_delta 0.1 --warmup 10

CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_exact_data.py --output_path data/piml/burgers_meta-test_test_so1000000.nc --equation_name burgers --num_samples 10 --equation_kwargs "{\"num_points\": 512, \"eta\": 0.1, \"mu\": 1.0, \"k_min\": 5, \"k_max\": 6, \"abs_a_min\": 0.25, \"abs_a_max\": 0.5, \"abs_omega_min\": 0.2, \"abs_omega_max\": 0.4}" --time_max 100 --time_delta 0.1 --warmup 10

# Different coefs
# Meta-training data: 0.25 < abs(A) <= 0.5, 0.2 < abs(omega) <= 0.4, l <- [5, 6]
# 100 steps, warmup 10
CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_training_data.py --output_path data/piml/burgers_meta-train_diff-coef.h5 --equation_name burgers --num_tasks 10 --equation_kwargs "{\"num_points\": 512, \"eta\": 0.07, \"mu\": 1.5, \"k_min\": 5, \"k_max\": 6, \"abs_a_min\": 0.25, \"abs_a_max\": 0.5, \"abs_omega_min\": 0.2, \"abs_omega_max\": 0.4}" --time_max 100 --time_delta 0.1 --warmup 10

# Different force
# Meta-training data: abs(A) <= 0.25, abs(omega) <= 0.2, l <- [3, 4]
# 100 steps, warmup 10
CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_training_data.py --output_path data/piml/burgers_meta-train_diff-force.h5 --equation_name burgers --num_tasks 10 --equation_kwargs "{\"num_points\": 512, \"eta\": 0.1, \"mu\": 1.0, \"k_min\": 3, \"k_max\": 4, \"abs_a_min\": 0, \"abs_a_max\": 0.25, \"abs_omega_min\": 0, \"abs_omega_max\": 0.2}" --time_max 100 --time_delta 0.1 --warmup 10

# Different coefs + different force
# Meta-training data: abs(A) <= 0.25, abs(omega) <= 0.2, l <- [3, 4]
# 100 steps, warmup 10
CUDA_VISIBLE_DEVICES=-1 python pde_superresolution/scripts/create_training_data.py --output_path data/piml/burgers_meta-train_diff-coef-force.h5 --equation_name burgers --num_tasks 10 --equation_kwargs "{\"num_points\": 512, \"eta\": 0.07, \"mu\": 1.5, \"k_min\": 3, \"k_max\": 4, \"abs_a_min\": 0, \"abs_a_max\": 0.25, \"abs_omega_min\": 0, \"abs_omega_max\": 0.2}" --time_max 100 --time_delta 0.1 --warmup 10