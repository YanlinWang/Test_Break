python utils/preprocess_examples.py data/QDMR/train.csv data/ --lexicon_file data/QDMR/train_lexicon_tokens.json --output_file_base train_dynamic

python utils/preprocess_examples.py data/QDMR/dev.csv data/ --lexicon_file data/QDMR/dev_lexicon_tokens.json --output_file_base dev_dynamic

export PYTHONPATH=/home/yanlwang/Test_Break/qdmr_parsing
export PYTHONPATH=/home/yanlwang/tmp/Test_Break/qdmr_parsing

python model/run_model.py \
--model rule_based \
--evaluate \
--question "Return the keywords which have been contained by more than 100 ACL papers" \
--gold "papers @@SEP@@ @@1@@ in ACL @@SEP@@ keywords of @@2@@ @@SEP@@ number of @@2@@ for each @@3@@ @@SEP@@ @@3@@ where @@4@@ is more than 100"

python model/run_model.py \
--input_file data/QDMR/dev.csv \
--model copy \
--evaluate \
--num_processes 10

# python model/run_model.py \
# --input_file data/dev_dynamic.tsv \
# --random_n 10 \
# --model dynamic \
# --model_dir trained_models/seq2seq-dynamic_layers1_lr0.001_hd450_dop0.2_final_low_dynamic/ \
# --evaluate

