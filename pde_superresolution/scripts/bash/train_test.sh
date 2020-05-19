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
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],tdm_type=linear" \
--input_path data/piml/burgers_meta-test_train.h5

# meta-train (with spatial & temporal derivative losses)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_lineartdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],space_derivatives_weight=1.0,tdm_type=linear" \
--input_path data/piml/burgers_meta-train_diff-coef.h5

# meta-test (train TDM only)
cp -r checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_lineartdm checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_lineartdm && \
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_lineartdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],tdm_learning_rate=1e-3,learning_stops=[40000,80000],tdm_type=linear" \
--input_path data/piml/burgers_meta-test_train.h5

# meta-test (train both)
cp -r checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_lineartdm checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_lineartdm_sdm && \
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_lineartdm_sdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[40000,80000],tdm_type=linear" \
--input_path data/piml/burgers_meta-test_train.h5




# modified to MLP tdm
# baseline (from scratch, linear learnable TDM)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_mlptdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],tdm_type=mlp" \
--input_path data/piml/burgers_meta-test_train.h5

# meta-train (with spatial & temporal derivative losses)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_mlptdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],space_derivatives_weight=1.0,tdm_type=mlp" \
--input_path data/piml/burgers_meta-train_diff-coef.h5

# meta-test (train TDM only)
cp -r checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_mlptdm checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_mlptdm && \
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_mlptdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],tdm_learning_rate=1e-3,learning_stops=[40000,80000],tdm_type=mlp" \
--input_path data/piml/burgers_meta-test_train.h5

# meta-test (train both)
cp -r checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_mlptdm checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_mlptdm_sdm && \
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_mlptdm_sdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[40000,80000],tdm_type=mlp" \
--input_path data/piml/burgers_meta-test_train.h5







# 2020-05-17
# baseline of finite difference method
# baseline, fixed TDM
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_fdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],conservative=False" \
--input_path data/piml/burgers_meta-test_train.h5

# baseline (from scratch, linear learnable TDM)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_lineartdm_fdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],tdm_type=linear,conservative=False" \
--input_path data/piml/burgers_meta-test_train.h5

# baseline (from scratch, mlp learnable TDM)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_mlptdm_fdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],tdm_type=mlp,conservative=False" \
--input_path data/piml/burgers_meta-test_train.h5
# meta-train (from scratch, mlp learnable TDM)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_mlptdm_fdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],tdm_type=mlp,conservative=False" \
--input_path data/piml/burgers_meta-train_diff-coef.h5
# meta-test (mlp learnable TDM, train TDM only)
cp -r checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_mlptdm_fdm checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_mlptdm_fdm && \
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_mlptdm_fdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],tdm_learning_rate=1e-3,learning_stops=[40000,80000],tdm_type=mlp,conservative=False" \
--input_path data/piml/burgers_meta-test_train.h5
# meta-test (mlp learnable TDM, train both)
cp -r checkpoints/synthetic/burgers/rs16/meta-train_diff-coef_mlptdm_fdm checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_mlptdm_sdm_fdm && \
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/meta-test_diff-coef_mlptdm_sdm_fdm \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[40000,80000],tdm_type=mlp,conservative=False" \
--input_path data/piml/burgers_meta-test_train.h5


# baseline of high-res spatial derivatives + finite difference
# baseline, fixed TDM
# python pde_superresolution/scripts/run_training.py \
# --checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_fdm_sdhighres \
# --equation burgers \
# --hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],conservative=False,sd_source=highres,ground_truth_order=3" \
# --input_path data/piml/burgers_meta-test_train.h5

# baseline (from scratch, linear learnable TDM)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_lineartdm_fdm_sdhighres \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],tdm_type=linear,conservative=False,sd_source=highres,ground_truth_order=3" \
--input_path data/piml/burgers_meta-test_train.h5

# baseline (from scratch, mlp learnable TDM)
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/synthetic/burgers/rs16/scratch_mlptdm_fdm_sdhighres \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],tdm_type=mlp,conservative=False,sd_source=highres,ground_truth_order=3" \
--input_path data/piml/burgers_meta-test_train.h5




# synthetic (finite difference method)
# burger's t4
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t4_scratch \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[60000,80000],conservative=False" \
--input_path data/piml/burgers_t4_train.h5

# burger's t5, different coefs
# meta-train, burger's t5
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t5_meta-train \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[20000,40000],space_derivatives_weight=1.0,conservative=False" \
--input_path data/piml/burgers_t5_train.h5

# meta-test, burger's t4
cp -r checkpoints/piml_burgers_t_fdm/t5_meta-train checkpoints/piml_burgers_t_fdm/t5-t4_meta-test
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t5-t4_meta-test \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[60000,80000],conservative=False" \
--input_path data/piml/burgers_t4_train.h5

# meta-test, burger's t4, tdm only
cp -r checkpoints/piml_burgers_t_fdm/t5_meta-train checkpoints/piml_burgers_t_fdm/t5-t4_meta-test_tdmonly
python pde_superresolution/scripts/run_training.py \
--checkpoint_dir checkpoints/piml_burgers_t_fdm/t5-t4_meta-test_tdmonly \
--equation burgers \
--hparams "resample_factor=16,learning_rates=[1e-3,1e-4],learning_stops=[60000,80000],conservative=False,tdm_learning_rate=1e-3" \
--input_path data/piml/burgers_t4_train.h5

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