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
