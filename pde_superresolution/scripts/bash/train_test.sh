# synthetic
# burger's t4
# python pde_superresolution/scripts/run_training.py \
# --checkpoint_dir checkpoints/piml_burgers_t4 \
# --equation burgers \
# --hparams "resample_factor=16,learning_stops=[1750,3500]" \
# --input_path data/piml/burgers_t4_train.h5

# baseline (from scratch)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000]" \
--input_path data/piml/burgers_meta-test_train.h5

# meta-train (with spatial & temporal derivative losses)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-train \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000]" \
--input_path data/piml/burgers_meta-test_train.h5