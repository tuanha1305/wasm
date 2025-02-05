// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file has been automatically generated. Please do not edit it manually.
// To regenerate the file, use the following command
// "generate_ffi_boilerplate.py".

// ignore_for_file: cascade_invocations
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unused_field

part of 'runtime.dart';

class WasmRuntime {
  final DynamicLibrary _lib;
  final _traps = <int, _WasmTrapsEntry>{};
  late final Pointer<WasmerEngine> _engine;

  late final WasmerDartInitializeApiDLFn _Dart_InitializeApiDL;
  late final WasmerSetFinalizerForEngineFn _set_finalizer_for_engine;
  late final WasmerSetFinalizerForFuncFn _set_finalizer_for_func;
  late final WasmerSetFinalizerForInstanceFn _set_finalizer_for_instance;
  late final WasmerSetFinalizerForMemoryFn _set_finalizer_for_memory;
  late final WasmerSetFinalizerForMemorytypeFn _set_finalizer_for_memorytype;
  late final WasmerSetFinalizerForModuleFn _set_finalizer_for_module;
  late final WasmerSetFinalizerForStoreFn _set_finalizer_for_store;
  late final WasmerSetFinalizerForTrapFn _set_finalizer_for_trap;
  late final WasmerWasiConfigCaptureStderrFn _wasi_config_capture_stderr;
  late final WasmerWasiConfigCaptureStdoutFn _wasi_config_capture_stdout;
  late final WasmerWasiConfigNewFn _wasi_config_new;
  late final WasmerWasiEnvDeleteFn _wasi_env_delete;
  late final WasmerWasiEnvNewFn _wasi_env_new;
  late final WasmerWasiEnvReadStderrFn _wasi_env_read_stderr;
  late final WasmerWasiEnvReadStdoutFn _wasi_env_read_stdout;
  late final WasmerWasiEnvSetMemoryFn _wasi_env_set_memory;
  late final WasmerWasiGetImportsFn _wasi_get_imports;
  late final WasmerByteVecDeleteFn _byte_vec_delete;
  late final WasmerByteVecNewFn _byte_vec_new;
  late final WasmerByteVecNewEmptyFn _byte_vec_new_empty;
  late final WasmerByteVecNewUninitializedFn _byte_vec_new_uninitialized;
  late final WasmerEngineDeleteFn _engine_delete;
  late final WasmerEngineNewFn _engine_new;
  late final WasmerExporttypeNameFn _exporttype_name;
  late final WasmerExporttypeTypeFn _exporttype_type;
  late final WasmerExporttypeVecDeleteFn _exporttype_vec_delete;
  late final WasmerExporttypeVecNewFn _exporttype_vec_new;
  late final WasmerExporttypeVecNewEmptyFn _exporttype_vec_new_empty;
  late final WasmerExporttypeVecNewUninitializedFn
      _exporttype_vec_new_uninitialized;
  late final WasmerExternAsFuncFn _extern_as_func;
  late final WasmerExternAsMemoryFn _extern_as_memory;
  late final WasmerExternDeleteFn _extern_delete;
  late final WasmerExternKindFn _extern_kind;
  late final WasmerExternVecDeleteFn _extern_vec_delete;
  late final WasmerExternVecNewFn _extern_vec_new;
  late final WasmerExternVecNewEmptyFn _extern_vec_new_empty;
  late final WasmerExternVecNewUninitializedFn _extern_vec_new_uninitialized;
  late final WasmerExterntypeAsFunctypeFn _externtype_as_functype;
  late final WasmerExterntypeDeleteFn _externtype_delete;
  late final WasmerExterntypeKindFn _externtype_kind;
  late final WasmerFuncAsExternFn _func_as_extern;
  late final WasmerFuncCallFn _func_call;
  late final WasmerFuncDeleteFn _func_delete;
  late final WasmerFuncNewWithEnvFn _func_new_with_env;
  late final WasmerFunctypeDeleteFn _functype_delete;
  late final WasmerFunctypeParamsFn _functype_params;
  late final WasmerFunctypeResultsFn _functype_results;
  late final WasmerImporttypeModuleFn _importtype_module;
  late final WasmerImporttypeNameFn _importtype_name;
  late final WasmerImporttypeTypeFn _importtype_type;
  late final WasmerImporttypeVecDeleteFn _importtype_vec_delete;
  late final WasmerImporttypeVecNewFn _importtype_vec_new;
  late final WasmerImporttypeVecNewEmptyFn _importtype_vec_new_empty;
  late final WasmerImporttypeVecNewUninitializedFn
      _importtype_vec_new_uninitialized;
  late final WasmerInstanceDeleteFn _instance_delete;
  late final WasmerInstanceExportsFn _instance_exports;
  late final WasmerInstanceNewFn _instance_new;
  late final WasmerMemoryAsExternFn _memory_as_extern;
  late final WasmerMemoryDataFn _memory_data;
  late final WasmerMemoryDataSizeFn _memory_data_size;
  late final WasmerMemoryDeleteFn _memory_delete;
  late final WasmerMemoryGrowFn _memory_grow;
  late final WasmerMemoryNewFn _memory_new;
  late final WasmerMemorySizeFn _memory_size;
  late final WasmerMemorytypeDeleteFn _memorytype_delete;
  late final WasmerMemorytypeNewFn _memorytype_new;
  late final WasmerModuleDeleteFn _module_delete;
  late final WasmerModuleExportsFn _module_exports;
  late final WasmerModuleImportsFn _module_imports;
  late final WasmerModuleNewFn _module_new;
  late final WasmerStoreDeleteFn _store_delete;
  late final WasmerStoreNewFn _store_new;
  late final WasmerTrapDeleteFn _trap_delete;
  late final WasmerTrapMessageFn _trap_message;
  late final WasmerTrapNewFn _trap_new;
  late final WasmerValtypeDeleteFn _valtype_delete;
  late final WasmerValtypeKindFn _valtype_kind;
  late final WasmerValtypeVecDeleteFn _valtype_vec_delete;
  late final WasmerValtypeVecNewFn _valtype_vec_new;
  late final WasmerValtypeVecNewEmptyFn _valtype_vec_new_empty;
  late final WasmerValtypeVecNewUninitializedFn _valtype_vec_new_uninitialized;
  late final WasmerWasmerLastErrorLengthFn _wasmer_last_error_length;
  late final WasmerWasmerLastErrorMessageFn _wasmer_last_error_message;

  WasmRuntime._init() : _lib = DynamicLibrary.open(_getLibPath()) {
    _Dart_InitializeApiDL = _lib.lookupFunction<
        NativeWasmerDartInitializeApiDLFn, WasmerDartInitializeApiDLFn>(
      'Dart_InitializeApiDL',
    );
    _set_finalizer_for_engine = _lib.lookupFunction<
        NativeWasmerSetFinalizerForEngineFn, WasmerSetFinalizerForEngineFn>(
      'set_finalizer_for_engine',
    );
    _set_finalizer_for_func = _lib.lookupFunction<
        NativeWasmerSetFinalizerForFuncFn, WasmerSetFinalizerForFuncFn>(
      'set_finalizer_for_func',
    );
    _set_finalizer_for_instance = _lib.lookupFunction<
        NativeWasmerSetFinalizerForInstanceFn, WasmerSetFinalizerForInstanceFn>(
      'set_finalizer_for_instance',
    );
    _set_finalizer_for_memory = _lib.lookupFunction<
        NativeWasmerSetFinalizerForMemoryFn, WasmerSetFinalizerForMemoryFn>(
      'set_finalizer_for_memory',
    );
    _set_finalizer_for_memorytype = _lib.lookupFunction<
        NativeWasmerSetFinalizerForMemorytypeFn,
        WasmerSetFinalizerForMemorytypeFn>(
      'set_finalizer_for_memorytype',
    );
    _set_finalizer_for_module = _lib.lookupFunction<
        NativeWasmerSetFinalizerForModuleFn, WasmerSetFinalizerForModuleFn>(
      'set_finalizer_for_module',
    );
    _set_finalizer_for_store = _lib.lookupFunction<
        NativeWasmerSetFinalizerForStoreFn, WasmerSetFinalizerForStoreFn>(
      'set_finalizer_for_store',
    );
    _set_finalizer_for_trap = _lib.lookupFunction<
        NativeWasmerSetFinalizerForTrapFn, WasmerSetFinalizerForTrapFn>(
      'set_finalizer_for_trap',
    );
    _wasi_config_capture_stderr = _lib.lookupFunction<
        NativeWasmerWasiConfigCaptureStderrFn, WasmerWasiConfigCaptureStderrFn>(
      'wasi_config_capture_stderr',
    );
    _wasi_config_capture_stdout = _lib.lookupFunction<
        NativeWasmerWasiConfigCaptureStdoutFn, WasmerWasiConfigCaptureStdoutFn>(
      'wasi_config_capture_stdout',
    );
    _wasi_config_new =
        _lib.lookupFunction<NativeWasmerWasiConfigNewFn, WasmerWasiConfigNewFn>(
      'wasi_config_new',
    );
    _wasi_env_delete =
        _lib.lookupFunction<NativeWasmerWasiEnvDeleteFn, WasmerWasiEnvDeleteFn>(
      'wasi_env_delete',
    );
    _wasi_env_new =
        _lib.lookupFunction<NativeWasmerWasiEnvNewFn, WasmerWasiEnvNewFn>(
      'wasi_env_new',
    );
    _wasi_env_read_stderr = _lib.lookupFunction<NativeWasmerWasiEnvReadStderrFn,
        WasmerWasiEnvReadStderrFn>(
      'wasi_env_read_stderr',
    );
    _wasi_env_read_stdout = _lib.lookupFunction<NativeWasmerWasiEnvReadStdoutFn,
        WasmerWasiEnvReadStdoutFn>(
      'wasi_env_read_stdout',
    );
    _wasi_env_set_memory = _lib.lookupFunction<NativeWasmerWasiEnvSetMemoryFn,
        WasmerWasiEnvSetMemoryFn>(
      'wasi_env_set_memory',
    );
    _wasi_get_imports = _lib
        .lookupFunction<NativeWasmerWasiGetImportsFn, WasmerWasiGetImportsFn>(
      'wasi_get_imports',
    );
    _byte_vec_delete =
        _lib.lookupFunction<NativeWasmerByteVecDeleteFn, WasmerByteVecDeleteFn>(
      'wasm_byte_vec_delete',
    );
    _byte_vec_new =
        _lib.lookupFunction<NativeWasmerByteVecNewFn, WasmerByteVecNewFn>(
      'wasm_byte_vec_new',
    );
    _byte_vec_new_empty = _lib
        .lookupFunction<NativeWasmerByteVecNewEmptyFn, WasmerByteVecNewEmptyFn>(
      'wasm_byte_vec_new_empty',
    );
    _byte_vec_new_uninitialized = _lib.lookupFunction<
        NativeWasmerByteVecNewUninitializedFn, WasmerByteVecNewUninitializedFn>(
      'wasm_byte_vec_new_uninitialized',
    );
    _engine_delete =
        _lib.lookupFunction<NativeWasmerEngineDeleteFn, WasmerEngineDeleteFn>(
      'wasm_engine_delete',
    );
    _engine_new =
        _lib.lookupFunction<NativeWasmerEngineNewFn, WasmerEngineNewFn>(
      'wasm_engine_new',
    );
    _exporttype_name = _lib
        .lookupFunction<NativeWasmerExporttypeNameFn, WasmerExporttypeNameFn>(
      'wasm_exporttype_name',
    );
    _exporttype_type = _lib
        .lookupFunction<NativeWasmerExporttypeTypeFn, WasmerExporttypeTypeFn>(
      'wasm_exporttype_type',
    );
    _exporttype_vec_delete = _lib.lookupFunction<
        NativeWasmerExporttypeVecDeleteFn, WasmerExporttypeVecDeleteFn>(
      'wasm_exporttype_vec_delete',
    );
    _exporttype_vec_new = _lib.lookupFunction<NativeWasmerExporttypeVecNewFn,
        WasmerExporttypeVecNewFn>(
      'wasm_exporttype_vec_new',
    );
    _exporttype_vec_new_empty = _lib.lookupFunction<
        NativeWasmerExporttypeVecNewEmptyFn, WasmerExporttypeVecNewEmptyFn>(
      'wasm_exporttype_vec_new_empty',
    );
    _exporttype_vec_new_uninitialized = _lib.lookupFunction<
        NativeWasmerExporttypeVecNewUninitializedFn,
        WasmerExporttypeVecNewUninitializedFn>(
      'wasm_exporttype_vec_new_uninitialized',
    );
    _extern_as_func =
        _lib.lookupFunction<NativeWasmerExternAsFuncFn, WasmerExternAsFuncFn>(
      'wasm_extern_as_func',
    );
    _extern_as_memory = _lib
        .lookupFunction<NativeWasmerExternAsMemoryFn, WasmerExternAsMemoryFn>(
      'wasm_extern_as_memory',
    );
    _extern_delete =
        _lib.lookupFunction<NativeWasmerExternDeleteFn, WasmerExternDeleteFn>(
      'wasm_extern_delete',
    );
    _extern_kind =
        _lib.lookupFunction<NativeWasmerExternKindFn, WasmerExternKindFn>(
      'wasm_extern_kind',
    );
    _extern_vec_delete = _lib
        .lookupFunction<NativeWasmerExternVecDeleteFn, WasmerExternVecDeleteFn>(
      'wasm_extern_vec_delete',
    );
    _extern_vec_new =
        _lib.lookupFunction<NativeWasmerExternVecNewFn, WasmerExternVecNewFn>(
      'wasm_extern_vec_new',
    );
    _extern_vec_new_empty = _lib.lookupFunction<NativeWasmerExternVecNewEmptyFn,
        WasmerExternVecNewEmptyFn>(
      'wasm_extern_vec_new_empty',
    );
    _extern_vec_new_uninitialized = _lib.lookupFunction<
        NativeWasmerExternVecNewUninitializedFn,
        WasmerExternVecNewUninitializedFn>(
      'wasm_extern_vec_new_uninitialized',
    );
    _externtype_as_functype = _lib.lookupFunction<
        NativeWasmerExterntypeAsFunctypeFn, WasmerExterntypeAsFunctypeFn>(
      'wasm_externtype_as_functype',
    );
    _externtype_delete = _lib.lookupFunction<NativeWasmerExterntypeDeleteFn,
        WasmerExterntypeDeleteFn>(
      'wasm_externtype_delete',
    );
    _externtype_kind = _lib
        .lookupFunction<NativeWasmerExterntypeKindFn, WasmerExterntypeKindFn>(
      'wasm_externtype_kind',
    );
    _func_as_extern =
        _lib.lookupFunction<NativeWasmerFuncAsExternFn, WasmerFuncAsExternFn>(
      'wasm_func_as_extern',
    );
    _func_call = _lib.lookupFunction<NativeWasmerFuncCallFn, WasmerFuncCallFn>(
      'wasm_func_call',
    );
    _func_delete =
        _lib.lookupFunction<NativeWasmerFuncDeleteFn, WasmerFuncDeleteFn>(
      'wasm_func_delete',
    );
    _func_new_with_env = _lib
        .lookupFunction<NativeWasmerFuncNewWithEnvFn, WasmerFuncNewWithEnvFn>(
      'wasm_func_new_with_env',
    );
    _functype_delete = _lib
        .lookupFunction<NativeWasmerFunctypeDeleteFn, WasmerFunctypeDeleteFn>(
      'wasm_functype_delete',
    );
    _functype_params = _lib
        .lookupFunction<NativeWasmerFunctypeParamsFn, WasmerFunctypeParamsFn>(
      'wasm_functype_params',
    );
    _functype_results = _lib
        .lookupFunction<NativeWasmerFunctypeResultsFn, WasmerFunctypeResultsFn>(
      'wasm_functype_results',
    );
    _importtype_module = _lib.lookupFunction<NativeWasmerImporttypeModuleFn,
        WasmerImporttypeModuleFn>(
      'wasm_importtype_module',
    );
    _importtype_name = _lib
        .lookupFunction<NativeWasmerImporttypeNameFn, WasmerImporttypeNameFn>(
      'wasm_importtype_name',
    );
    _importtype_type = _lib
        .lookupFunction<NativeWasmerImporttypeTypeFn, WasmerImporttypeTypeFn>(
      'wasm_importtype_type',
    );
    _importtype_vec_delete = _lib.lookupFunction<
        NativeWasmerImporttypeVecDeleteFn, WasmerImporttypeVecDeleteFn>(
      'wasm_importtype_vec_delete',
    );
    _importtype_vec_new = _lib.lookupFunction<NativeWasmerImporttypeVecNewFn,
        WasmerImporttypeVecNewFn>(
      'wasm_importtype_vec_new',
    );
    _importtype_vec_new_empty = _lib.lookupFunction<
        NativeWasmerImporttypeVecNewEmptyFn, WasmerImporttypeVecNewEmptyFn>(
      'wasm_importtype_vec_new_empty',
    );
    _importtype_vec_new_uninitialized = _lib.lookupFunction<
        NativeWasmerImporttypeVecNewUninitializedFn,
        WasmerImporttypeVecNewUninitializedFn>(
      'wasm_importtype_vec_new_uninitialized',
    );
    _instance_delete = _lib
        .lookupFunction<NativeWasmerInstanceDeleteFn, WasmerInstanceDeleteFn>(
      'wasm_instance_delete',
    );
    _instance_exports = _lib
        .lookupFunction<NativeWasmerInstanceExportsFn, WasmerInstanceExportsFn>(
      'wasm_instance_exports',
    );
    _instance_new =
        _lib.lookupFunction<NativeWasmerInstanceNewFn, WasmerInstanceNewFn>(
      'wasm_instance_new',
    );
    _memory_as_extern = _lib
        .lookupFunction<NativeWasmerMemoryAsExternFn, WasmerMemoryAsExternFn>(
      'wasm_memory_as_extern',
    );
    _memory_data =
        _lib.lookupFunction<NativeWasmerMemoryDataFn, WasmerMemoryDataFn>(
      'wasm_memory_data',
    );
    _memory_data_size = _lib
        .lookupFunction<NativeWasmerMemoryDataSizeFn, WasmerMemoryDataSizeFn>(
      'wasm_memory_data_size',
    );
    _memory_delete =
        _lib.lookupFunction<NativeWasmerMemoryDeleteFn, WasmerMemoryDeleteFn>(
      'wasm_memory_delete',
    );
    _memory_grow =
        _lib.lookupFunction<NativeWasmerMemoryGrowFn, WasmerMemoryGrowFn>(
      'wasm_memory_grow',
    );
    _memory_new =
        _lib.lookupFunction<NativeWasmerMemoryNewFn, WasmerMemoryNewFn>(
      'wasm_memory_new',
    );
    _memory_size =
        _lib.lookupFunction<NativeWasmerMemorySizeFn, WasmerMemorySizeFn>(
      'wasm_memory_size',
    );
    _memorytype_delete = _lib.lookupFunction<NativeWasmerMemorytypeDeleteFn,
        WasmerMemorytypeDeleteFn>(
      'wasm_memorytype_delete',
    );
    _memorytype_new =
        _lib.lookupFunction<NativeWasmerMemorytypeNewFn, WasmerMemorytypeNewFn>(
      'wasm_memorytype_new',
    );
    _module_delete =
        _lib.lookupFunction<NativeWasmerModuleDeleteFn, WasmerModuleDeleteFn>(
      'wasm_module_delete',
    );
    _module_exports =
        _lib.lookupFunction<NativeWasmerModuleExportsFn, WasmerModuleExportsFn>(
      'wasm_module_exports',
    );
    _module_imports =
        _lib.lookupFunction<NativeWasmerModuleImportsFn, WasmerModuleImportsFn>(
      'wasm_module_imports',
    );
    _module_new =
        _lib.lookupFunction<NativeWasmerModuleNewFn, WasmerModuleNewFn>(
      'wasm_module_new',
    );
    _store_delete =
        _lib.lookupFunction<NativeWasmerStoreDeleteFn, WasmerStoreDeleteFn>(
      'wasm_store_delete',
    );
    _store_new = _lib.lookupFunction<NativeWasmerStoreNewFn, WasmerStoreNewFn>(
      'wasm_store_new',
    );
    _trap_delete =
        _lib.lookupFunction<NativeWasmerTrapDeleteFn, WasmerTrapDeleteFn>(
      'wasm_trap_delete',
    );
    _trap_message =
        _lib.lookupFunction<NativeWasmerTrapMessageFn, WasmerTrapMessageFn>(
      'wasm_trap_message',
    );
    _trap_new = _lib.lookupFunction<NativeWasmerTrapNewFn, WasmerTrapNewFn>(
      'wasm_trap_new',
    );
    _valtype_delete =
        _lib.lookupFunction<NativeWasmerValtypeDeleteFn, WasmerValtypeDeleteFn>(
      'wasm_valtype_delete',
    );
    _valtype_kind =
        _lib.lookupFunction<NativeWasmerValtypeKindFn, WasmerValtypeKindFn>(
      'wasm_valtype_kind',
    );
    _valtype_vec_delete = _lib.lookupFunction<NativeWasmerValtypeVecDeleteFn,
        WasmerValtypeVecDeleteFn>(
      'wasm_valtype_vec_delete',
    );
    _valtype_vec_new =
        _lib.lookupFunction<NativeWasmerValtypeVecNewFn, WasmerValtypeVecNewFn>(
      'wasm_valtype_vec_new',
    );
    _valtype_vec_new_empty = _lib.lookupFunction<
        NativeWasmerValtypeVecNewEmptyFn, WasmerValtypeVecNewEmptyFn>(
      'wasm_valtype_vec_new_empty',
    );
    _valtype_vec_new_uninitialized = _lib.lookupFunction<
        NativeWasmerValtypeVecNewUninitializedFn,
        WasmerValtypeVecNewUninitializedFn>(
      'wasm_valtype_vec_new_uninitialized',
    );
    _wasmer_last_error_length = _lib.lookupFunction<
        NativeWasmerWasmerLastErrorLengthFn, WasmerWasmerLastErrorLengthFn>(
      'wasmer_last_error_length',
    );
    _wasmer_last_error_message = _lib.lookupFunction<
        NativeWasmerWasmerLastErrorMessageFn, WasmerWasmerLastErrorMessageFn>(
      'wasmer_last_error_message',
    );

    if (_Dart_InitializeApiDL(NativeApi.initializeApiDLData) != 0) {
      throw WasmError('Failed to initialize Dart API');
    }
    _engine = _engine_new();
    _checkNotEqual(_engine, nullptr, 'Failed to initialize Wasm engine.');
    _set_finalizer_for_engine(this, _engine);
  }

  Pointer<WasmerStore> newStore(Object owner) {
    var store = _checkNotEqual(
      _store_new(_engine),
      nullptr,
      'Failed to create Wasm store.',
    );
    _set_finalizer_for_store(owner, store);
    return store;
  }

  Pointer<WasmerModule> compile(
    Object owner,
    Pointer<WasmerStore> store,
    Uint8List data,
  ) {
    var dataPtr = calloc<Uint8>(data.length);
    for (var i = 0; i < data.length; ++i) {
      dataPtr[i] = data[i];
    }
    var dataVec = calloc<WasmerByteVec>();
    dataVec.ref.data = dataPtr;
    dataVec.ref.length = data.length;

    var modulePtr = _module_new(store, dataVec);

    calloc.free(dataPtr);
    calloc.free(dataVec);

    _checkNotEqual(modulePtr, nullptr, 'Wasm module compile failed.');
    _set_finalizer_for_module(owner, modulePtr);
    return modulePtr;
  }

  List<WasmExportDescriptor> exportDescriptors(Pointer<WasmerModule> module) {
    var exportsVec = calloc<WasmerExporttypeVec>();
    _module_exports(module, exportsVec);
    var exps = <WasmExportDescriptor>[];
    for (var i = 0; i < exportsVec.ref.length; ++i) {
      var exp = exportsVec.ref.data[i];
      var extern = _exporttype_type(exp);
      var kind = _externtype_kind(extern);
      var fnType = kind == wasmerExternKindFunction
          ? _externtype_as_functype(extern)
          : nullptr;
      exps.add(
        WasmExportDescriptor._(
          kind,
          _exporttype_name(exp).ref.toString(),
          fnType,
        ),
      );
    }
    calloc.free(exportsVec);
    return exps;
  }

  List<WasmImportDescriptor> importDescriptors(Pointer<WasmerModule> module) {
    var importsVec = calloc<WasmerImporttypeVec>();
    _module_imports(module, importsVec);
    var imps = <WasmImportDescriptor>[];
    for (var i = 0; i < importsVec.ref.length; ++i) {
      var imp = importsVec.ref.data[i];
      var extern = _importtype_type(imp);
      var kind = _externtype_kind(extern);
      var fnType = kind == wasmerExternKindFunction
          ? _externtype_as_functype(extern)
          : nullptr;
      imps.add(
        WasmImportDescriptor._(
          kind,
          _importtype_module(imp).ref.toString(),
          _importtype_name(imp).ref.toString(),
          fnType,
        ),
      );
    }
    calloc.free(importsVec);
    return imps;
  }

  void maybeThrowTrap(Pointer<WasmerTrap> trap, String source) {
    if (trap != nullptr) {
      // There are 2 kinds of trap, and their memory is managed differently.
      // Traps created in the newTrap method below are stored in the traps map
      // with a corresponding exception, and their memory is managed using a
      // finalizer on the _WasmTrapsEntry. Traps can also be created by WASM
      // code, and in that case we delete them in this function.
      var entry = _traps.remove(trap.address);
      if (entry == null) {
        throw WasmError(
          'This case is not (yet) supported. Please file an issue on pkg:wasm.',
        );
      }
      // ignore: only_throw_errors
      throw entry.exception;
    }
  }

  Pointer<WasmerInstance> instantiate(
    Object owner,
    Pointer<WasmerStore> store,
    Pointer<WasmerModule> module,
    Pointer<WasmerExternVec> imports,
  ) {
    var trap = calloc<Pointer<WasmerTrap>>();
    trap.value = nullptr;
    var inst = _instance_new(store, module, imports, trap);
    maybeThrowTrap(trap.value, 'module initialization function');
    calloc.free(trap);
    _checkNotEqual(inst, nullptr, 'Wasm module instantiation failed.');
    _set_finalizer_for_instance(owner, inst);
    return inst;
  }

  // Clean up the exports after use, with deleteExports.
  Pointer<WasmerExternVec> exports(Pointer<WasmerInstance> instancePtr) {
    var exports = calloc<WasmerExternVec>();
    _instance_exports(instancePtr, exports);
    return exports;
  }

  void deleteExports(Pointer<WasmerExternVec> exports) {
    _extern_vec_delete(exports);
    calloc.free(exports);
  }

  int externKind(Pointer<WasmerExtern> extern) => _extern_kind(extern);

  Pointer<WasmerFunc> externToFunction(Pointer<WasmerExtern> extern) =>
      _extern_as_func(extern);

  Pointer<WasmerExtern> functionToExtern(Pointer<WasmerFunc> func) =>
      _func_as_extern(func);

  List<int> getArgTypes(Pointer<WasmerFunctype> funcType) {
    var types = <int>[];
    var args = _functype_params(funcType);
    for (var i = 0; i < args.ref.length; ++i) {
      types.add(_valtype_kind(args.ref.data[i]));
    }
    return types;
  }

  int getReturnType(Pointer<WasmerFunctype> funcType) {
    var rets = _functype_results(funcType);
    if (rets.ref.length == 0) {
      return wasmerValKindVoid;
    } else if (rets.ref.length > 1) {
      throw WasmError('Multiple return values are not supported');
    }
    return _valtype_kind(rets.ref.data[0]);
  }

  void call(
    Pointer<WasmerFunc> func,
    Pointer<WasmerValVec> args,
    Pointer<WasmerValVec> results,
    String source,
  ) {
    maybeThrowTrap(_func_call(func, args, results), source);
  }

  Pointer<WasmerMemory> externToMemory(Pointer<WasmerExtern> extern) =>
      _extern_as_memory(extern);

  Pointer<WasmerExtern> memoryToExtern(Pointer<WasmerMemory> memory) =>
      _memory_as_extern(memory);

  Pointer<WasmerMemory> newMemory(
    Object owner,
    Pointer<WasmerStore> store,
    int pages,
    int? maxPages,
  ) {
    var limPtr = calloc<WasmerLimits>();
    limPtr.ref.min = pages;
    limPtr.ref.max = maxPages ?? wasmLimitsMaxDefault;
    var memType = _memorytype_new(limPtr);
    calloc.free(limPtr);
    _checkNotEqual(memType, nullptr, 'Failed to create memory type.');
    _set_finalizer_for_memorytype(owner, memType);
    var memory = _checkNotEqual(
      _memory_new(store, memType),
      nullptr,
      'Failed to create memory.',
    );
    _set_finalizer_for_memory(owner, memory);
    return memory;
  }

  void growMemory(Pointer<WasmerMemory> memory, int deltaPages) {
    _checkNotEqual(
      _memory_grow(memory, deltaPages),
      0,
      'Failed to grow memory.',
    );
  }

  int memoryLength(Pointer<WasmerMemory> memory) => _memory_size(memory);

  Uint8List memoryView(Pointer<WasmerMemory> memory) =>
      _memory_data(memory).asTypedList(_memory_data_size(memory));

  Pointer<WasmerFunc> newFunc(
    Object owner,
    Pointer<WasmerStore> store,
    Pointer<WasmerFunctype> funcType,
    Pointer func,
    Pointer env,
    Pointer finalizer,
  ) {
    var f = _func_new_with_env(
      store,
      funcType,
      func.cast(),
      env.cast(),
      finalizer.cast(),
    );
    _checkNotEqual(f, nullptr, 'Failed to create function.');
    _set_finalizer_for_func(owner, f);
    return f;
  }

  Pointer<WasmerTrap> newTrap(Pointer<WasmerStore> store, Object exception) {
    var msg = calloc<WasmerByteVec>();
    msg.ref.data = calloc<Uint8>();
    msg.ref.data[0] = 0;
    msg.ref.length = 0;
    var trap = _trap_new(store, msg);
    calloc.free(msg.ref.data);
    calloc.free(msg);
    _checkNotEqual(trap, nullptr, 'Failed to create trap.');
    var entry = _WasmTrapsEntry(exception);
    _set_finalizer_for_trap(entry, trap);
    _traps[trap.address] = entry;
    return trap;
  }

  Pointer<WasmerWasiConfig> newWasiConfig() {
    var name = calloc<Uint8>();
    name[0] = 0;
    var config = _wasi_config_new(name);
    calloc.free(name);
    return _checkNotEqual(config, nullptr, 'Failed to create WASI config.');
  }

  void captureWasiStdout(Pointer<WasmerWasiConfig> config) {
    _wasi_config_capture_stdout(config);
  }

  void captureWasiStderr(Pointer<WasmerWasiConfig> config) {
    _wasi_config_capture_stderr(config);
  }

  Pointer<WasmerWasiEnv> newWasiEnv(Pointer<WasmerWasiConfig> config) =>
      _checkNotEqual(
        _wasi_env_new(config),
        nullptr,
        'Failed to create WASI environment.',
      );

  void wasiEnvSetMemory(
    Pointer<WasmerWasiEnv> env,
    Pointer<WasmerMemory> memory,
  ) {
    _wasi_env_set_memory(env, memory);
  }

  void getWasiImports(
    Pointer<WasmerStore> store,
    Pointer<WasmerModule> mod,
    Pointer<WasmerWasiEnv> env,
    Pointer<WasmerExternVec> imports,
  ) {
    _checkNotEqual(
      _wasi_get_imports(store, mod, env, imports),
      0,
      'Failed to fill WASI imports.',
    );
  }

  Stream<List<int>> getWasiStdoutStream(Pointer<WasmerWasiEnv> env) =>
      Stream.fromIterable(_WasiStreamIterable(env, _wasi_env_read_stdout));

  Stream<List<int>> getWasiStderrStream(Pointer<WasmerWasiEnv> env) =>
      Stream.fromIterable(_WasiStreamIterable(env, _wasi_env_read_stderr));

  String _getLastError() {
    var length = _wasmer_last_error_length();
    var buf = calloc<Uint8>(length);
    _wasmer_last_error_message(buf, length);
    var message = utf8.decode(buf.asTypedList(length));
    calloc.free(buf);
    return message;
  }

  T _checkNotEqual<T>(T x, T y, String errorMessage) {
    if (x == y) {
      throw WasmError('$errorMessage\n${_getLastError()}'.trim());
    }
    return x;
  }
}
