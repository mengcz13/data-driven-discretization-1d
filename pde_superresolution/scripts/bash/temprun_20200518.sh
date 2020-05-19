# burger's t6, different initial conditions
# meta-train, burger's t6
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t6_meta-train \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],space_derivatives_weight=1.0,conservative=False" \
--input_path data/piml/burgers_t6_train.h5

# meta-test, burger's t6
cp -r checkpoints/piml_burgers_t_fdm/t6_meta-train checkpoints/piml_burgers_t_fdm/t6-t4_meta-test
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t6-t4_meta-test \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[60000,80000],conservative=False" \
--input_path data/piml/burgers_t4_train.h5

# burger's t7, different initial conditions
# meta-train, burger's t7
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t7_meta-train \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],space_derivatives_weight=1.0,conservative=False" \
--input_path data/piml/burgers_t7_train.h5

# meta-test, burger's t7
cp -r checkpoints/piml_burgers_t_fdm/t7_meta-train checkpoints/piml_burgers_t_fdm/t7-t4_meta-test
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t7-t4_meta-test \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[60000,80000],conservative=False" \
--input_path data/piml/burgers_t4_train.h5