mkdir build
cd build
cmake -G Ninja .. \
    -DIMAGE_PROCESSING_BENCHMARKS=ON \
    -DDEEP_LEARNING_BENCHMARKS=ON \
    -DOpenCV_DIR=$PWD/../opencv/build/ \
    -DBUDDY_OPT_BUILD_DIR=$PWD/../buddy-mlir/build/ 
ninja
