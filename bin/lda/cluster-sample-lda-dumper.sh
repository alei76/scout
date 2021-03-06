#!/bin/bash
HADOOP=hadoop
WORK_DIR=${SCOUT_HOME}/dataset
SCOUT=${SCOUT_HOME}/bin/scout

OPEN_COMMAND=cat

#DIRECTORY SETTINGS
#seqdirectory
DATASET_DIR=sample-source
SEQ_DIR=sample-out-seqdir
#seq2sparse
SEQ2SPARSE_DIR=sample-out-seqdir-sparse-lda
DF_COUNT_DIR=${SEQ2SPARSE_DIR}/df-count
DICTIONARY_FILE=${SEQ2SPARSE_DIR}/dictionary.file-0
FREQUENCY_FILE=${SEQ2SPARSE_DIR}/frequency.file-0
TFVECTORS_DIR=${SEQ2SPARSE_DIR}/tf-vectors
TFIDFVECTORS_DIR=${SEQ2SPARSE_DIR}/tfidf-vectors
TOKENIZED_DOCUMENTS_DIR=${SEQ2SPARSE_DIR}/tokenized-documents
WORDCOUNT_DIR=${SEQ2SPARSE_DIR}/wordcount
#rowid
ROWID_MATRIX_DIR=sample-out-matrix
#cvb
DICTIONARY_FILES=${SEQ2SPARSE_DIR}/dictionary.file-*
LDA_DIR=sample-lda
LDA_TOPICS_DIR=sample-lda-topics
LDA_MODEL_DIR=sample-lda-model

if [ "x$1" = "xseqdirectory" ];then

#seqdirectory dumper
rm -rf ${WORK_DIR}/${SEQ_DIR}
mkdir -p ${WORK_DIR}/${SEQ_DIR}
$SCOUT seqdumper -i ${WORK_DIR}/${SEQ_DIR} -o ${WORK_DIR}/${SEQ_DIR}/chunk-0-dumper -n 10
#$OPEN_COMMAND ${WORK_DIR}/${SEQ_DIR}/chunk-0-dumper

elif [ "x$1" = "xcvb" ];then
#cvb
rm -rf ${WORK_DIR}/${LDA_TOPICS_DIR}
rm -rf ${WORK_DIR}/${ROWID_MATRIX_DIR}
mkdir -p ${WORK_DIR}/${LDA_TOPICS_DIR}
mkdir -p ${WORK_DIR}/${ROWID_MATRIX_DIR}
$SCOUT seqdumper -i ${WORK_DIR}/${LDA_TOPICS_DIR} -o ${WORK_DIR}/${LDA_TOPICS_DIR}/part-r-00000 -n 10
$SCOUT seqdumper -i ${WORK_DIR}/${ROWID_MATRIX_DIR} -o ${WORK_DIR}/${ROWID_MATRIX_DIR}/docIndex -n 10


fi
