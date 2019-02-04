#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([Mplus], [0.1], [ncgrp@ars.usda.gov])
AC_CONFIG_SRCDIR([mp.cpp])
AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE([foreign])

# Checks for programs.
AC_LANG([C++])
AC_PROG_CXX

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([floor strerror])

AC_ARG_ENABLE([parallelism],
    AS_HELP_STRING([--disable-parallelism], [Disable feature parallelism]))

AS_IF([test "x$enable_parallelism" != "xno"], [
   AC_MSG_NOTICE([enabling parallelism])
   AC_DEFINE([ENABLE_PARALLELISM], [1], ["enabling parallel"])
], [
   AC_MSG_NOTICE([disabling parallelism])
])
AC_OPENMP
AC_SUBST([AM_CXXFLAGS], "$OPENMP_CXXFLAGS $AM_CXXFLAGS")
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
