set(CMAKE_CXX_COMPILER "/nix/store/vz80by8cnidi68zd47dw6c5clrkdq3f7-clang-wrapper-14.0.6/bin/clang++")
set(CMAKE_CXX_COMPILER_ARG1 "")
set(CMAKE_CXX_COMPILER_ID "Clang")
set(CMAKE_CXX_COMPILER_VERSION "14.0.6")
set(CMAKE_CXX_COMPILER_VERSION_INTERNAL "")
set(CMAKE_CXX_COMPILER_WRAPPER "")
set(CMAKE_CXX_STANDARD_COMPUTED_DEFAULT "14")
set(CMAKE_CXX_EXTENSIONS_COMPUTED_DEFAULT "ON")
set(CMAKE_CXX_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters;cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates;cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates;cxx_std_17;cxx_std_20;cxx_std_23")
set(CMAKE_CXX98_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters")
set(CMAKE_CXX11_COMPILE_FEATURES "cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates")
set(CMAKE_CXX14_COMPILE_FEATURES "cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates")
set(CMAKE_CXX17_COMPILE_FEATURES "cxx_std_17")
set(CMAKE_CXX20_COMPILE_FEATURES "cxx_std_20")
set(CMAKE_CXX23_COMPILE_FEATURES "cxx_std_23")

set(CMAKE_CXX_PLATFORM_ID "Linux")
set(CMAKE_CXX_SIMULATE_ID "")
set(CMAKE_CXX_COMPILER_FRONTEND_VARIANT "GNU")
set(CMAKE_CXX_SIMULATE_VERSION "")




set(CMAKE_AR "/nix/store/vz80by8cnidi68zd47dw6c5clrkdq3f7-clang-wrapper-14.0.6/bin/ar")
set(CMAKE_CXX_COMPILER_AR "CMAKE_CXX_COMPILER_AR-NOTFOUND")
set(CMAKE_RANLIB "/nix/store/vz80by8cnidi68zd47dw6c5clrkdq3f7-clang-wrapper-14.0.6/bin/ranlib")
set(CMAKE_CXX_COMPILER_RANLIB "CMAKE_CXX_COMPILER_RANLIB-NOTFOUND")
set(CMAKE_LINKER "/nix/store/vz80by8cnidi68zd47dw6c5clrkdq3f7-clang-wrapper-14.0.6/bin/ld")
set(CMAKE_LINKER_LINK "")
set(CMAKE_LINKER_LLD "")
set(CMAKE_CXX_COMPILER_LINKER "/nix/store/9z1yc545csxqy2cd45qxzkxmfq6c88aa-binutils-wrapper-2.42/bin/ld")
set(CMAKE_CXX_COMPILER_LINKER_ID "GNU")
set(CMAKE_CXX_COMPILER_LINKER_VERSION 2.42)
set(CMAKE_CXX_COMPILER_LINKER_FRONTEND_VARIANT GNU)
set(CMAKE_MT "")
set(CMAKE_TAPI "CMAKE_TAPI-NOTFOUND")
set(CMAKE_COMPILER_IS_GNUCXX )
set(CMAKE_CXX_COMPILER_LOADED 1)
set(CMAKE_CXX_COMPILER_WORKS TRUE)
set(CMAKE_CXX_ABI_COMPILED TRUE)

set(CMAKE_CXX_COMPILER_ENV_VAR "CXX")

set(CMAKE_CXX_COMPILER_ID_RUN 1)
set(CMAKE_CXX_SOURCE_FILE_EXTENSIONS C;M;c++;cc;cpp;cxx;m;mm;mpp;CPP;ixx;cppm;ccm;cxxm;c++m)
set(CMAKE_CXX_IGNORE_EXTENSIONS inl;h;hpp;HPP;H;o;O;obj;OBJ;def;DEF;rc;RC)

foreach (lang IN ITEMS C OBJC OBJCXX)
  if (CMAKE_${lang}_COMPILER_ID_RUN)
    foreach(extension IN LISTS CMAKE_${lang}_SOURCE_FILE_EXTENSIONS)
      list(REMOVE_ITEM CMAKE_CXX_SOURCE_FILE_EXTENSIONS ${extension})
    endforeach()
  endif()
endforeach()

set(CMAKE_CXX_LINKER_PREFERENCE 30)
set(CMAKE_CXX_LINKER_PREFERENCE_PROPAGATES 1)
set(CMAKE_CXX_LINKER_DEPFILE_SUPPORTED FALSE)

# Save compiler ABI information.
set(CMAKE_CXX_SIZEOF_DATA_PTR "8")
set(CMAKE_CXX_COMPILER_ABI "ELF")
set(CMAKE_CXX_BYTE_ORDER "LITTLE_ENDIAN")
set(CMAKE_CXX_LIBRARY_ARCHITECTURE "x86_64-linux-gnu")

if(CMAKE_CXX_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_CXX_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_CXX_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_CXX_COMPILER_ABI}")
endif()

if(CMAKE_CXX_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "x86_64-linux-gnu")
endif()

set(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_CXX_CL_SHOWINCLUDES_PREFIX}")
endif()





set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES "/nix/store/0gxrwp9xnzb5li8i7w3q7qmm0lm808qq-libX11-1.8.9-dev/include;/nix/store/ny34a9migrcin09zwgbkr0ymx72mvlfg-xorgproto-2024.1/include;/nix/store/qj9byzfvh7dd61kk0aglj7cwqj1xqg6l-zlib-1.3.1-dev/include;/nix/store/smacbfb82wp7ncz2rwac68jd50qxr70a-libglvnd-1.7.0-dev/include;/nix/store/a83znbrflv30lvhww0d2rljbyd5mw0c0-pulseaudio-17.0-dev/include;/nix/store/xslrgzkvciny0m0cqbgq4bnvydvpdkgx-libcap-2.69-dev/include;/nix/store/nn78wg4rgns62w5sfzyxashxizd0lfva-attr-2.5.2-dev/include;/nix/store/5h49djy8q0d2sc3nhbgwf74pw84bv0l3-gcc-13.3.0/include/c++/13.3.0;/nix/store/5h49djy8q0d2sc3nhbgwf74pw84bv0l3-gcc-13.3.0/include/c++/13.3.0/x86_64-unknown-linux-gnu;/nix/store/vz80by8cnidi68zd47dw6c5clrkdq3f7-clang-wrapper-14.0.6/resource-root/include;/nix/store/ag3bka67zxgrwmp2550k8fdmiv3krzc2-glibc-2.39-52-dev/include")
set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "stdc++;m;gcc_s;gcc;c;gcc_s;gcc")
set(CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES "/nix/store/hggpnywm6l7cfh2ml1ynm50ap9x4f9rn-mesa-24.0.7-drivers/lib;/nix/store/jz3vvf4nsyirb25rh9dbhksm4gq6wybb-libglvnd-1.7.0/lib;/nix/store/5nk2ga7i2f030am4qpcdsd8qlk6i3z83-attr-2.5.2/lib;/nix/store/yvhyhcfhc98wm86pw4ygk5jdr804iwrw-libcap-2.69-lib/lib;/nix/store/pn9glkalcj7i5p549dpsl1c46pkb13xr-pulseaudio-17.0/lib;/nix/store/wlffq5p6mxxgfap10sav3ij936jzqm59-glibc-2.39-52/lib;/nix/store/5h49djy8q0d2sc3nhbgwf74pw84bv0l3-gcc-13.3.0/lib/gcc/x86_64-unknown-linux-gnu/13.3.0;/nix/store/zx9zgvy2nsxcmpn0fzx277m5lk352cdf-gcc-13.3.0-lib/lib;/nix/store/5h49djy8q0d2sc3nhbgwf74pw84bv0l3-gcc-13.3.0/lib;/nix/store/3ilxy06yvz70vg6ld86kyjr6qb248vd6-gcc-13.3.0-libgcc/lib;/nix/store/5xhwypkf1fs44z3bbv4s1jwck5hycvmv-clang-14.0.6-lib/lib;/nix/store/5h49djy8q0d2sc3nhbgwf74pw84bv0l3-gcc-13.3.0/lib64/gcc/x86_64-unknown-linux-gnu/13.3.0;/nix/store/5h49djy8q0d2sc3nhbgwf74pw84bv0l3-gcc-13.3.0/lib64;/lib/x86_64-linux-gnu;/lib64;/usr/lib/x86_64-linux-gnu;/usr/lib64;/lib;/usr/lib;/nix/store/x9fw7rbdb34gq0f8q750kw344lbv9nk1-libX11-1.8.9/lib;/nix/store/ny34a9migrcin09zwgbkr0ymx72mvlfg-xorgproto-2024.1/lib;/nix/store/lv6nackqis28gg7l2ic43f6nk52hb39g-zlib-1.3.1/lib")
set(CMAKE_CXX_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
set(CMAKE_CXX_COMPILER_CLANG_RESOURCE_DIR "/nix/store/vz80by8cnidi68zd47dw6c5clrkdq3f7-clang-wrapper-14.0.6/resource-root")