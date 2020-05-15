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
# python pde_superresolution/scripts/run_training.py \
# --checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_lr3e-3 \
# --equation burgers \
# --hparams "resample_factor=16,learning_rates=[3e-3,3e-4],learning_stops=[20000,40000]" \
# --input_path data/piml/burgers_meta-test_train.h5

# baseline (from scratch) + spatial derivatives
CUDA_DEVICE_ORDER=PCI_BUS_ID CUDA_VISIBLE_DEVICES=0 python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_sdloss \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],space_derivatives_weight=1.0" \
--input_path data/piml/burgers_meta-test_train.h5

# meta-train (with spatial & temporal derivative losses)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-train_diff-coef \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],space_derivatives_weight=1.0" \
--input_path data/piml/burgers_meta-train_diff-coef.h5

# meta-test
cp -r checkpoints/synthetic/burgers/rs16/meta-train_diff-coef checkpoints/synthetic/burgers/rs16/meta-test_diff-coef && \
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[40000,60000],init_checkpoint_dir=checkpoints/synthetic/burgers/rs16/meta-train_diff-coef" \
--input_path data/piml/burgers_meta-test_train.h5

cp -r checkpoints/synthetic/burgers/rs16/meta-train_diff-coef checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_1k && \
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_1k \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3],learning_stops=[41000],init_checkpoint_dir=checkpoints/synthetic/burgers/rs16/meta-train_diff-coef" \
--input_path data/piml/burgers_meta-test_train.h5




# baseline (from scratch, linear learnable TDM)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_lineartdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],model_target=time_derivative_nn" \
--input_path data/piml/burgers_meta-test_train.h5

# meta-train (with spatial & temporal derivative losses)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_lineartdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],space_derivatives_weight=1.0,model_target=time_derivative_nn" \
--input_path data/piml/burgers_meta-train_diff-coef.h5

# meta-test (train TDM only)
cp -r checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_lineartdm checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_lineartdm && \
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_lineartdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],tdm_learning_rate=1e-3,learning_stops=[40000,80000],model_target=time_derivative_nn" \
--input_path data/piml/burgers_meta-test_train.h5