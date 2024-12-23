{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_my_project (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/mnt/c/Users/User/Documents/GitHub/numbers-waterfall/.stack-work/install/x86_64-linux/5335e6df435beae7e20244e13e8907b6e9db0a735eb62e5846b8b3145199eb6b/9.4.8/bin"
libdir     = "/mnt/c/Users/User/Documents/GitHub/numbers-waterfall/.stack-work/install/x86_64-linux/5335e6df435beae7e20244e13e8907b6e9db0a735eb62e5846b8b3145199eb6b/9.4.8/lib/x86_64-linux-ghc-9.4.8/my-project-0.1.0.0-1l8nBt6oIYO9hCJ5t7AR0D-my-project"
dynlibdir  = "/mnt/c/Users/User/Documents/GitHub/numbers-waterfall/.stack-work/install/x86_64-linux/5335e6df435beae7e20244e13e8907b6e9db0a735eb62e5846b8b3145199eb6b/9.4.8/lib/x86_64-linux-ghc-9.4.8"
datadir    = "/mnt/c/Users/User/Documents/GitHub/numbers-waterfall/.stack-work/install/x86_64-linux/5335e6df435beae7e20244e13e8907b6e9db0a735eb62e5846b8b3145199eb6b/9.4.8/share/x86_64-linux-ghc-9.4.8/my-project-0.1.0.0"
libexecdir = "/mnt/c/Users/User/Documents/GitHub/numbers-waterfall/.stack-work/install/x86_64-linux/5335e6df435beae7e20244e13e8907b6e9db0a735eb62e5846b8b3145199eb6b/9.4.8/libexec/x86_64-linux-ghc-9.4.8/my-project-0.1.0.0"
sysconfdir = "/mnt/c/Users/User/Documents/GitHub/numbers-waterfall/.stack-work/install/x86_64-linux/5335e6df435beae7e20244e13e8907b6e9db0a735eb62e5846b8b3145199eb6b/9.4.8/etc"

getBinDir     = catchIO (getEnv "my_project_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "my_project_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "my_project_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "my_project_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_project_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
