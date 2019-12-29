#

# run modified sesame (the neural framenet parser)

# =====
# basic path
SESAME_HOME="./"
INPUT_PARSE_JSON="../input.en.par.json"
TMP_FILES_DIR="./"
OUTPUT_DOC_JSON="./"

# =====
# run (for sesame, use python2)
# step 1: target id
python2 ${SESAME_HOME}/sesame/targetid.py --mode predict --model_name ${SESAME_HOME}/logs/fn1.7-pretrained-targetid/ --raw_input ${INPUT_PARSE_JSON} --output ${TMP_FILES_DIR}/_tmp1.conll --filter_pos v
# step 2: frame id
python2 ${SESAME_HOME}/sesame/frameid.py --mode predict --model_name ${SESAME_HOME}/logs/fn1.7-pretrained-frameid/ --raw_input ${TMP_FILES_DIR}/_tmp1.conll --output ${TMP_FILES_DIR}/_tmp2.conll
# step 3: arg id
python2 ${SESAME_HOME}/sesame/argid.py --mode predict --model_name ${SESAME_HOME}/logs/fn1.7-pretrained-argid/ --raw_input ${TMP_FILES_DIR}/_tmp2.conll --output ${TMP_FILES_DIR}/_tmp3.conll
# final step: merge into doc json format
# todo
