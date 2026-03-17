help([[
loads UFS Model prerequisites for OrionLLVM/Intel
]])

prepend_path("MODULEPATH", "/apps/contrib/spack-stack/modulefiles")
prepend_path("MODULEPATH", "/apps/contrib/spack-stack/spack-stack-2.1.0/envs/ue-oneapi-2025.3.1/modules/Core")

stack_intel_ver=os.getenv("stack_intel_ver") or "2025.3.1"
load(pathJoin("stack-oneapi", stack_intel_ver))

stack_impi_ver=os.getenv("stack_impi_ver") or "2021.17"
load(pathJoin("stack-intel-oneapi-mpi", stack_impi_ver))

cmake_ver=os.getenv("cmake_ver") or "3.31.8"
load(pathJoin("cmake", cmake_ver))

load("ufs_common")
-- load("zlib/1.2.13")

nccmp_ver=os.getenv("nccmp_ver") or "1.9.0.1"
load(pathJoin("nccmp", nccmp_ver))
-- tar_ver=os.getenv("tar_ver") or "1.34"
-- load(pathJoin("tar", tar_ver))

setenv("I_MPI_CC", "icx")
setenv("I_MPI_CXX", "icpx")
setenv("I_MPI_F90", "ifx")

setenv("CC", "mpiicx")
setenv("CXX", "mpiicpx")
setenv("FC", "mpiifx")
setenv("CMAKE_Platform", "orion.intel")

whatis("Description: UFS build environment")
