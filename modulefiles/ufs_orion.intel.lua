help([[
loads UFS Model prerequisites for Orion/Intel
]])

-- prepend_path("MODULEPATH", "/work/noaa/epic/role-epic/spack-stack/orion/spack-stack-1.6.0/envs/fms-2024.01/install/modulefiles/Core")
prepend_path("MODULEPATH", "/work/noaa/epic/role-epic/jenkins/workspace/spack-stack/ufs/Orion/weekly/envs/ue-intel/install/modulefiles/Core")

stack_intel_ver=os.getenv("stack_intel_ver") or "2021.9.0"
io.stderr:write("stack_intel_ver ", stack_intel_ver,"\n")
load(pathJoin("stack-intel", stack_intel_ver))

stack_impi_ver=os.getenv("stack_impi_ver") or "2021.9.0"
load(pathJoin("stack-intel-oneapi-mpi", stack_impi_ver))

-- cmake_ver=os.getenv("cmake_ver") or "3.23.1"
cmake_ver=os.getenv("cmake_ver") or "3.27.9"
load(pathJoin("cmake", cmake_ver))

-- load("ufs_common")

io.stderr:write("stack_impi_ver ",stack_impi_ver,"\n")
io.stderr:write("cmake_ver ",cmake_ver,"\n")

-- HDF5 needed for LM4
-- hdf5_ver=os.getenv("hdf5_ver") or "1.14.0"
-- hdf5_ver=os.getenv("hdf5_ver") or "1.14.3"
-- load(pathJoin("hdf5", hdf5_ver))
-- nccmp_ver=os.getenv("nccmp_ver") or "1.9.0.1"
-- load(pathJoin("nccmp", nccmp_ver))

load("ufs-weather-model-env/1.0.0")
load("sp/2.5.0")

setenv("CC", "mpiicc")
setenv("CXX", "mpiicpc")
setenv("FC", "mpiifort")
setenv("CMAKE_Platform", "orion.intel")

whatis("Description: UFS build environment")
