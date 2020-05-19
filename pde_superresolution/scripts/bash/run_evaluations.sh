# run evaluation on scratch

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch \
--exact_solution_path data/piml/burgers_meta-test_test.nc \
--equation_name burgers \
--stop_times "[10,20,30,40,50,60,70,80,90,100]" \
--num_samples 10 \
--warmup 10 \
--time_delta 0.1 \
--time_max 100 \
--logtostderr

# run evaluation on meta-test

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef \
--exact_solution_path data/piml/burgers_meta-test_test.nc \
--equation_name burgers \
--stop_times "[10,20,30,40,50,60,70,80,90,100]" \
--num_samples 10 \
--warmup 10 \
--time_delta 0.1 \
--time_max 100 \
--logtostderr

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-train_diff-coef \
--exact_solution_path data/piml/burgers_meta-test_test.nc \
--equation_name burgers \
--stop_times "[10,20,30,40,50,60,70,80,90,100]" \
--num_samples 10 \
--warmup 10 \
--time_delta 0.1 \
--time_max 100 \
--logtostderr

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-train_diff-coef \
--exact_solution_path data/piml/burgers_meta-test_test.nc \
--equation_name burgers \
--stop_times "[10,20,30,40,50,60,70,80,90,100]" \
--num_samples 10 \
--warmup 10 \
--time_delta 0.1 \
--time_max 100 \
--logtostderr

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_1k \
--exact_solution_path data/piml/burgers_meta-test_test.nc \
--equation_name burgers \
--stop_times "[10,20,30,40,50,60,70,80,90,100]" \
--num_samples 10 \
--warmup 10 \
--time_delta 0.1 \
--time_max 100 \
--logtostderr

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_1k \
--exact_solution_path data/piml/burgers_meta-test_test_so1000000.nc \
--equation_name burgers \
--stop_times "[10,20,30,40,50,60,70,80,90,100]" \
--num_samples 10 \
--warmup 10 \
--time_delta 0.1 \
--time_max 100 \
--logtostderr

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch \
--exact_solution_path data/piml/burgers_meta-test_test_so1000000.nc \
--equation_name burgers \
--stop_times "[10,20,30,40,50,60,70,80,90,100]" \
--num_samples 10 \
--warmup 10 \
--time_delta 0.1 \
--time_max 100 \
--logtostderr

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef \
--exact_solution_path data/piml/burgers_meta-test_test_so1000000.nc \
--equation_name burgers \
--stop_times "[10,20,30,40,50,60,70,80,90,100]" \
--num_samples 10 \
--warmup 10 \
--time_delta 0.1 \
--time_max 100 \
--logtostderr


# single burger's t4
python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t4_scratch \
--exact_solution_path data/piml/burgers_t4_test.nc \
--equation_name burgers \
--stop_times "[0.7,0.8,0.9,1.0]" \
--num_samples 1 \
--warmup 0.67 \
--time_delta 0.005 \
--time_max 0.33 \
--logtostderr

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t5-t4_meta-test \
--exact_solution_path data/piml/burgers_t4_test.nc \
--equation_name burgers \
--stop_times "[0.7,0.8,0.9,1.0]" \
--num_samples 1 \
--warmup 0.67 \
--time_delta 0.005 \
--time_max 0.33 \
--logtostderr

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t6-t4_meta-test \
--exact_solution_path data/piml/burgers_t4_test.nc \
--equation_name burgers \
--stop_times "[0.7,0.8,0.9,1.0]" \
--num_samples 1 \
--warmup 0.67 \
--time_delta 0.005 \
--time_max 0.33 \
--logtostderr

python pde_superresolution/scripts/run_evaluation.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t7-t4_meta-test \
--exact_solution_path data/piml/burgers_t4_test.nc \
--equation_name burgers \
--stop_times "[0.7,0.8,0.9,1.0]" \
--num_samples 1 \
--warmup 0.67 \
--time_delta 0.005 \
--time_max 0.33 \
--logtostderr