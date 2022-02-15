# mkdir build
# cd build
# cmake -G Ninja .. \
#     -DIMAGE_PROCESSING_BENCHMARKS=ON \
#     -DDEEP_LEARNING_BENCHMARKS=ON \
#     -DOpenCV_DIR=$PWD/../opencv/build/ \
#     -DBUDDY_OPT_BUILD_DIR=$PWD/../buddy-mlir/build/ 
# ninja

./buddy-mlir/build/bin/buddy-opt ./benchmarks/ImageProcessing/BuddyConv2D.mlir \
  -conv-vectorization="strip-mining=256" \
  -lower-affine -convert-scf-to-cf -convert-vector-to-llvm \
  -convert-memref-to-llvm -convert-std-to-llvm='emit-c-wrappers=1' \
  -reconcile-unrealized-casts | \
  ${LLVM_MLIR_BINARY_DIR}/mlir-translate --mlir-to-llvmir -o log.ll
