
# Generated by live2d/generate.py

ctypedef csmVersion (__stdcall * csmGetVersionType)()
cdef csmGetVersionType csmGetVersion
ctypedef csmMocVersion (__stdcall * csmGetLatestMocVersionType)()
cdef csmGetLatestMocVersionType csmGetLatestMocVersion
ctypedef csmMocVersion (__stdcall * csmGetMocVersionType)(const void*, const unsigned int)
cdef csmGetMocVersionType csmGetMocVersion
ctypedef csmLogFunction (__stdcall * csmGetLogFunctionType)()
cdef csmGetLogFunctionType csmGetLogFunction
ctypedef void (__stdcall * csmSetLogFunctionType)(csmLogFunction)
cdef csmSetLogFunctionType csmSetLogFunction
ctypedef csmMoc* (__stdcall * csmReviveMocInPlaceType)(void*, const unsigned int)
cdef csmReviveMocInPlaceType csmReviveMocInPlace
ctypedef unsigned int (__stdcall * csmGetSizeofModelType)(const csmMoc*)
cdef csmGetSizeofModelType csmGetSizeofModel
ctypedef csmModel* (__stdcall * csmInitializeModelInPlaceType)(const csmMoc*, void*, const unsigned int)
cdef csmInitializeModelInPlaceType csmInitializeModelInPlace
ctypedef void (__stdcall * csmUpdateModelType)(csmModel*)
cdef csmUpdateModelType csmUpdateModel
ctypedef void (__stdcall * csmReadCanvasInfoType)(const csmModel*, csmVector2*, csmVector2*, float*)
cdef csmReadCanvasInfoType csmReadCanvasInfo
ctypedef int (__stdcall * csmGetParameterCountType)(const csmModel*)
cdef csmGetParameterCountType csmGetParameterCount
ctypedef const char** (__stdcall * csmGetParameterIdsType)(const csmModel*)
cdef csmGetParameterIdsType csmGetParameterIds
ctypedef const float* (__stdcall * csmGetParameterMinimumValuesType)(const csmModel*)
cdef csmGetParameterMinimumValuesType csmGetParameterMinimumValues
ctypedef const float* (__stdcall * csmGetParameterMaximumValuesType)(const csmModel*)
cdef csmGetParameterMaximumValuesType csmGetParameterMaximumValues
ctypedef const float* (__stdcall * csmGetParameterDefaultValuesType)(const csmModel*)
cdef csmGetParameterDefaultValuesType csmGetParameterDefaultValues
ctypedef float* (__stdcall * csmGetParameterValuesType)(csmModel*)
cdef csmGetParameterValuesType csmGetParameterValues
ctypedef int (__stdcall * csmGetPartCountType)(const csmModel*)
cdef csmGetPartCountType csmGetPartCount
ctypedef const char** (__stdcall * csmGetPartIdsType)(const csmModel*)
cdef csmGetPartIdsType csmGetPartIds
ctypedef float* (__stdcall * csmGetPartOpacitiesType)(csmModel*)
cdef csmGetPartOpacitiesType csmGetPartOpacities
ctypedef const int* (__stdcall * csmGetPartParentPartIndicesType)(const csmModel*)
cdef csmGetPartParentPartIndicesType csmGetPartParentPartIndices
ctypedef int (__stdcall * csmGetDrawableCountType)(const csmModel*)
cdef csmGetDrawableCountType csmGetDrawableCount
ctypedef const char** (__stdcall * csmGetDrawableIdsType)(const csmModel*)
cdef csmGetDrawableIdsType csmGetDrawableIds
ctypedef const csmFlags* (__stdcall * csmGetDrawableConstantFlagsType)(const csmModel*)
cdef csmGetDrawableConstantFlagsType csmGetDrawableConstantFlags
ctypedef const csmFlags* (__stdcall * csmGetDrawableDynamicFlagsType)(const csmModel*)
cdef csmGetDrawableDynamicFlagsType csmGetDrawableDynamicFlags
ctypedef const int* (__stdcall * csmGetDrawableTextureIndicesType)(const csmModel*)
cdef csmGetDrawableTextureIndicesType csmGetDrawableTextureIndices
ctypedef const int* (__stdcall * csmGetDrawableDrawOrdersType)(const csmModel*)
cdef csmGetDrawableDrawOrdersType csmGetDrawableDrawOrders
ctypedef const int* (__stdcall * csmGetDrawableRenderOrdersType)(const csmModel*)
cdef csmGetDrawableRenderOrdersType csmGetDrawableRenderOrders
ctypedef const float* (__stdcall * csmGetDrawableOpacitiesType)(const csmModel*)
cdef csmGetDrawableOpacitiesType csmGetDrawableOpacities
ctypedef const int* (__stdcall * csmGetDrawableMaskCountsType)(const csmModel*)
cdef csmGetDrawableMaskCountsType csmGetDrawableMaskCounts
ctypedef const int** (__stdcall * csmGetDrawableMasksType)(const csmModel*)
cdef csmGetDrawableMasksType csmGetDrawableMasks
ctypedef const int* (__stdcall * csmGetDrawableVertexCountsType)(const csmModel*)
cdef csmGetDrawableVertexCountsType csmGetDrawableVertexCounts
ctypedef const csmVector2** (__stdcall * csmGetDrawableVertexPositionsType)(const csmModel*)
cdef csmGetDrawableVertexPositionsType csmGetDrawableVertexPositions
ctypedef const csmVector2** (__stdcall * csmGetDrawableVertexUvsType)(const csmModel*)
cdef csmGetDrawableVertexUvsType csmGetDrawableVertexUvs
ctypedef const int* (__stdcall * csmGetDrawableIndexCountsType)(const csmModel*)
cdef csmGetDrawableIndexCountsType csmGetDrawableIndexCounts
ctypedef const unsigned short** (__stdcall * csmGetDrawableIndicesType)(const csmModel*)
cdef csmGetDrawableIndicesType csmGetDrawableIndices
ctypedef const csmVector4* (__stdcall * csmGetDrawableMultiplyColorsType)(const csmModel*)
cdef csmGetDrawableMultiplyColorsType csmGetDrawableMultiplyColors
ctypedef const csmVector4* (__stdcall * csmGetDrawableScreenColorsType)(const csmModel*)
cdef csmGetDrawableScreenColorsType csmGetDrawableScreenColors
ctypedef void (__stdcall * csmResetDrawableDynamicFlagsType)(csmModel*)
cdef csmResetDrawableDynamicFlagsType csmResetDrawableDynamicFlags


cdef bint did_load = False

def load(dll):
    global did_load

    if did_load:
        return True

    did_load = True

    cdef void *object = NULL

    if dll:
        object = SDL_LoadObject(dll)

        if not object:
            return False

    global csmGetVersion
    csmGetVersion = <csmGetVersionType> SDL_LoadFunction(object, "csmGetVersion")
    if not csmGetVersion:
        raise Exception("csmGetVersion not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetLatestMocVersion
    csmGetLatestMocVersion = <csmGetLatestMocVersionType> SDL_LoadFunction(object, "csmGetLatestMocVersion")
    if not csmGetLatestMocVersion:
        raise Exception("csmGetLatestMocVersion not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetMocVersion
    csmGetMocVersion = <csmGetMocVersionType> SDL_LoadFunction(object, "csmGetMocVersion")
    if not csmGetMocVersion:
        raise Exception("csmGetMocVersion not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetLogFunction
    csmGetLogFunction = <csmGetLogFunctionType> SDL_LoadFunction(object, "csmGetLogFunction")
    if not csmGetLogFunction:
        raise Exception("csmGetLogFunction not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmSetLogFunction
    csmSetLogFunction = <csmSetLogFunctionType> SDL_LoadFunction(object, "csmSetLogFunction")
    if not csmSetLogFunction:
        raise Exception("csmSetLogFunction not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmReviveMocInPlace
    csmReviveMocInPlace = <csmReviveMocInPlaceType> SDL_LoadFunction(object, "csmReviveMocInPlace")
    if not csmReviveMocInPlace:
        raise Exception("csmReviveMocInPlace not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetSizeofModel
    csmGetSizeofModel = <csmGetSizeofModelType> SDL_LoadFunction(object, "csmGetSizeofModel")
    if not csmGetSizeofModel:
        raise Exception("csmGetSizeofModel not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmInitializeModelInPlace
    csmInitializeModelInPlace = <csmInitializeModelInPlaceType> SDL_LoadFunction(object, "csmInitializeModelInPlace")
    if not csmInitializeModelInPlace:
        raise Exception("csmInitializeModelInPlace not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmUpdateModel
    csmUpdateModel = <csmUpdateModelType> SDL_LoadFunction(object, "csmUpdateModel")
    if not csmUpdateModel:
        raise Exception("csmUpdateModel not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmReadCanvasInfo
    csmReadCanvasInfo = <csmReadCanvasInfoType> SDL_LoadFunction(object, "csmReadCanvasInfo")
    if not csmReadCanvasInfo:
        raise Exception("csmReadCanvasInfo not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetParameterCount
    csmGetParameterCount = <csmGetParameterCountType> SDL_LoadFunction(object, "csmGetParameterCount")
    if not csmGetParameterCount:
        raise Exception("csmGetParameterCount not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetParameterIds
    csmGetParameterIds = <csmGetParameterIdsType> SDL_LoadFunction(object, "csmGetParameterIds")
    if not csmGetParameterIds:
        raise Exception("csmGetParameterIds not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetParameterMinimumValues
    csmGetParameterMinimumValues = <csmGetParameterMinimumValuesType> SDL_LoadFunction(object, "csmGetParameterMinimumValues")
    if not csmGetParameterMinimumValues:
        raise Exception("csmGetParameterMinimumValues not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetParameterMaximumValues
    csmGetParameterMaximumValues = <csmGetParameterMaximumValuesType> SDL_LoadFunction(object, "csmGetParameterMaximumValues")
    if not csmGetParameterMaximumValues:
        raise Exception("csmGetParameterMaximumValues not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetParameterDefaultValues
    csmGetParameterDefaultValues = <csmGetParameterDefaultValuesType> SDL_LoadFunction(object, "csmGetParameterDefaultValues")
    if not csmGetParameterDefaultValues:
        raise Exception("csmGetParameterDefaultValues not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetParameterValues
    csmGetParameterValues = <csmGetParameterValuesType> SDL_LoadFunction(object, "csmGetParameterValues")
    if not csmGetParameterValues:
        raise Exception("csmGetParameterValues not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetPartCount
    csmGetPartCount = <csmGetPartCountType> SDL_LoadFunction(object, "csmGetPartCount")
    if not csmGetPartCount:
        raise Exception("csmGetPartCount not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetPartIds
    csmGetPartIds = <csmGetPartIdsType> SDL_LoadFunction(object, "csmGetPartIds")
    if not csmGetPartIds:
        raise Exception("csmGetPartIds not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetPartOpacities
    csmGetPartOpacities = <csmGetPartOpacitiesType> SDL_LoadFunction(object, "csmGetPartOpacities")
    if not csmGetPartOpacities:
        raise Exception("csmGetPartOpacities not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetPartParentPartIndices
    csmGetPartParentPartIndices = <csmGetPartParentPartIndicesType> SDL_LoadFunction(object, "csmGetPartParentPartIndices")
    if not csmGetPartParentPartIndices:
        raise Exception("csmGetPartParentPartIndices not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableCount
    csmGetDrawableCount = <csmGetDrawableCountType> SDL_LoadFunction(object, "csmGetDrawableCount")
    if not csmGetDrawableCount:
        raise Exception("csmGetDrawableCount not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableIds
    csmGetDrawableIds = <csmGetDrawableIdsType> SDL_LoadFunction(object, "csmGetDrawableIds")
    if not csmGetDrawableIds:
        raise Exception("csmGetDrawableIds not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableConstantFlags
    csmGetDrawableConstantFlags = <csmGetDrawableConstantFlagsType> SDL_LoadFunction(object, "csmGetDrawableConstantFlags")
    if not csmGetDrawableConstantFlags:
        raise Exception("csmGetDrawableConstantFlags not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableDynamicFlags
    csmGetDrawableDynamicFlags = <csmGetDrawableDynamicFlagsType> SDL_LoadFunction(object, "csmGetDrawableDynamicFlags")
    if not csmGetDrawableDynamicFlags:
        raise Exception("csmGetDrawableDynamicFlags not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableTextureIndices
    csmGetDrawableTextureIndices = <csmGetDrawableTextureIndicesType> SDL_LoadFunction(object, "csmGetDrawableTextureIndices")
    if not csmGetDrawableTextureIndices:
        raise Exception("csmGetDrawableTextureIndices not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableDrawOrders
    csmGetDrawableDrawOrders = <csmGetDrawableDrawOrdersType> SDL_LoadFunction(object, "csmGetDrawableDrawOrders")
    if not csmGetDrawableDrawOrders:
        raise Exception("csmGetDrawableDrawOrders not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableRenderOrders
    csmGetDrawableRenderOrders = <csmGetDrawableRenderOrdersType> SDL_LoadFunction(object, "csmGetDrawableRenderOrders")
    if not csmGetDrawableRenderOrders:
        raise Exception("csmGetDrawableRenderOrders not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableOpacities
    csmGetDrawableOpacities = <csmGetDrawableOpacitiesType> SDL_LoadFunction(object, "csmGetDrawableOpacities")
    if not csmGetDrawableOpacities:
        raise Exception("csmGetDrawableOpacities not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableMaskCounts
    csmGetDrawableMaskCounts = <csmGetDrawableMaskCountsType> SDL_LoadFunction(object, "csmGetDrawableMaskCounts")
    if not csmGetDrawableMaskCounts:
        raise Exception("csmGetDrawableMaskCounts not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableMasks
    csmGetDrawableMasks = <csmGetDrawableMasksType> SDL_LoadFunction(object, "csmGetDrawableMasks")
    if not csmGetDrawableMasks:
        raise Exception("csmGetDrawableMasks not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableVertexCounts
    csmGetDrawableVertexCounts = <csmGetDrawableVertexCountsType> SDL_LoadFunction(object, "csmGetDrawableVertexCounts")
    if not csmGetDrawableVertexCounts:
        raise Exception("csmGetDrawableVertexCounts not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableVertexPositions
    csmGetDrawableVertexPositions = <csmGetDrawableVertexPositionsType> SDL_LoadFunction(object, "csmGetDrawableVertexPositions")
    if not csmGetDrawableVertexPositions:
        raise Exception("csmGetDrawableVertexPositions not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableVertexUvs
    csmGetDrawableVertexUvs = <csmGetDrawableVertexUvsType> SDL_LoadFunction(object, "csmGetDrawableVertexUvs")
    if not csmGetDrawableVertexUvs:
        raise Exception("csmGetDrawableVertexUvs not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableIndexCounts
    csmGetDrawableIndexCounts = <csmGetDrawableIndexCountsType> SDL_LoadFunction(object, "csmGetDrawableIndexCounts")
    if not csmGetDrawableIndexCounts:
        raise Exception("csmGetDrawableIndexCounts not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableIndices
    csmGetDrawableIndices = <csmGetDrawableIndicesType> SDL_LoadFunction(object, "csmGetDrawableIndices")
    if not csmGetDrawableIndices:
        raise Exception("csmGetDrawableIndices not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableMultiplyColors
    csmGetDrawableMultiplyColors = <csmGetDrawableMultiplyColorsType> SDL_LoadFunction(object, "csmGetDrawableMultiplyColors")
    if not csmGetDrawableMultiplyColors:
        raise Exception("csmGetDrawableMultiplyColors not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmGetDrawableScreenColors
    csmGetDrawableScreenColors = <csmGetDrawableScreenColorsType> SDL_LoadFunction(object, "csmGetDrawableScreenColors")
    if not csmGetDrawableScreenColors:
        raise Exception("csmGetDrawableScreenColors not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")
    global csmResetDrawableDynamicFlags
    csmResetDrawableDynamicFlags = <csmResetDrawableDynamicFlagsType> SDL_LoadFunction(object, "csmResetDrawableDynamicFlags")
    if not csmResetDrawableDynamicFlags:
        raise Exception("csmResetDrawableDynamicFlags not found in Live2D dll " + dll.decode() + ". (The dll could be an old version.)")

    post_init()

    return True
