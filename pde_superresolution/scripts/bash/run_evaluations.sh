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