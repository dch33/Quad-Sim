#ifndef __SF_DEBUG_MACROS_H__
#define __SF_DEBUG_MACROS_H__

extern unsigned int _humanMovementTestMachineNumber_;
#define _SFD_SET_DATA_VALUE_PTR(v1,v2)\
	sf_debug_set_instance_data_value_ptr(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,CHARTINSTANCE_INSTANCENUMBER,v1,(void *)(v2),NULL);
#define _SFD_UNSET_DATA_VALUE_PTR(v1)\
	sf_debug_unset_instance_data_value_ptr(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,CHARTINSTANCE_INSTANCENUMBER,v1);
#define _SFD_SET_DATA_VALUE_PTR_VAR_DIM(v1,v2,v3)\
	sf_debug_set_instance_data_value_ptr(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,CHARTINSTANCE_INSTANCENUMBER,v1,(void *)(v2),(void *)(v3));
#define _SFD_DATA_RANGE_CHECK_MIN_MAX(dVal,dNum,dMin,dMax)\
                      sf_debug_data_range_error_wrapper_min_max(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             dNum,(double)(dVal),(double)dMin,(double)dMax)
#define _SFD_DATA_RANGE_CHECK_MIN(dVal,dNum,dMin)\
                      sf_debug_data_range_error_wrapper_min(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             dNum,(double)(dVal),(double)dMin)
#define _SFD_DATA_RANGE_CHECK_MAX(dVal,dNum,dMax)\
                      sf_debug_data_range_error_wrapper_max(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             dNum,(double)(dVal),(double)dMax)
#define _SFD_DATA_RANGE_CHECK(dVal,dNum)\
                      sf_debug_data_range_wrapper(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             dNum,(double)(dVal))
#define _SFD_DATA_READ_BEFORE_WRITE_CHECK(dNum,dVal)\
                      sf_debug_read_before_write_check(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (unsigned int)(dNum),(bool)dVal)
#define _SFD_ARRAY_BOUNDS_CHECK(v1,v2,v3,v4,v5,v6) \
                      sf_debug_data_array_bounds_error_check(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),(int)(v2),(int)(v3),(int)(v4),(int)(v5),(int)(v6))
#define _SFD_RUNTIME_SIZE_MISMATCH_CHECK(v1,v2,v3,v4,v5) \
                      sf_debug_data_runtime_size_mismatch_error_check(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),(v2),(unsigned int)(v3),(int)(v4),(int)(v5))
#define _SFD_EML_ARRAY_BOUNDS_CHECK(v1,v2,v3,v4,v5,v6) \
                      sf_debug_eml_data_array_bounds_error_check(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),(int)(v2),(int)(v3),(int)(v4),(int)(v5),(int)(v6))
#ifdef INT_TYPE_64_IS_SUPPORTED
#define _SFD_EML_ARRAY_BOUNDS_CHECK_INT64(v1,v2,v3,v4,v5,v6) \
                      sf_debug_eml_data_array_bounds_error_check_int64(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),(int64_T)(v2),(int)(v3),(int)(v4),(int)(v5),(int)(v6))
#endif
#define _SFD_INTEGER_CHECK(v1,v2) \
                      sf_debug_integer_check(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),(double)(v2))
#define _SFD_NOT_NAN_CHECK(v1,v2) \
                      sf_debug_not_nan_check(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),(double)(v2))
#define _SFD_NON_NEGATIVE_CHECK(v1,v2) \
                      sf_debug_non_negative_check(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),(double)(v2))
#define _SFD_CAST_TO_UINT8(v1) \
                      sf_debug_cast_to_uint8_T(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),0,0)
#define _SFD_CAST_TO_UINT16(v1) \
                      sf_debug_cast_to_uint16_T(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),0,0)
#define _SFD_CAST_TO_UINT32(v1) \
                      sf_debug_cast_to_uint32_T(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),0,0)
#define _SFD_CAST_TO_INT8(v1) \
                      sf_debug_cast_to_int8_T(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),0,0)
#define _SFD_CAST_TO_INT16(v1) \
                      sf_debug_cast_to_int16_T(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),0,0)
#define _SFD_CAST_TO_INT32(v1) \
                      sf_debug_cast_to_int32_T(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),0,0)
#define _SFD_CAST_TO_SINGLE(v1) \
                      sf_debug_cast_to_real32_T(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
                                             (v1),0,0)
#define _SFD_TRANSITION_CONFLICT(v1,v2) sf_debug_transition_conflict_error(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
v1,v2)
#define _SFD_ANIMATE() sf_debug_animate(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER)
#define _SFD_CHART_CALL(v1,v2,v3,v4) sf_debug_call(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
CHART_OBJECT,v1,v2,v3,v4,\
0,NULL,_sfTime_,1)
#define _SFD_CC_CALL(v2,v3,v4) _SFD_CHART_CALL(CHART_OBJECT,v2,v3,v4)
#define _SFD_CS_CALL(v2,v3,v4) _SFD_CHART_CALL(STATE_OBJECT,v2,v3,v4)
#define _SFD_CT_CALL(v2,v3,v4) _SFD_CHART_CALL(TRANSITION_OBJECT,v2,v3,v4)
#define _SFD_CE_CALL(v2,v3,v4) _SFD_CHART_CALL(EVENT_OBJECT,v2,v3,v4)
#define _SFD_CM_CALL(v2,v3,v4) _SFD_CHART_CALL(MESSAGE_OBJECT,v2,v3,v4)
#define _SFD_EML_CALL(v1,v2,v3) eml_debug_line_call(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
v1,v2,\
v3,_sfTime_,0)
#define _SFD_SCRIPT_TRANSLATION(v1,v2,v3,v4) sf_debug_set_script_translation(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
v1,v2,v3,v4)
#define _SFD_SCRIPT_CALL(v1,v2,v3) eml_debug_line_call(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
v1,v2,\
v3,_sfTime_,1)
#define _SFD_CCP_CALL(v3,v4,v5,v6) sf_debug_call(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
CHART_OBJECT,TRANSITION_OBJECT,TRANSITION_GUARD_COVERAGE_TAG,v3,v6,\
v4,NULL,_sfTime_,(unsigned int)(v5))
#define _SFD_STATE_TEMPORAL_THRESHOLD(v1,v2,v4) sf_debug_temporal_threshold(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
(unsigned int)(v1),(v2),STATE_OBJECT,(v4))
#define _SFD_TRANS_TEMPORAL_THRESHOLD(v1,v2,v4) sf_debug_temporal_threshold(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
CHARTINSTANCE_CHARTNUMBER,\
CHARTINSTANCE_INSTANCENUMBER,\
(unsigned int)(v1),(v2),TRANSITION_OBJECT,(v4))
#define CV_EVAL(v1,v2,v3,v4) cv_eval_point(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(boolean_T)(v4))
#define CV_CHART_EVAL(v2,v3,v4) CV_EVAL(CHART_OBJECT,(v2),(v3),(v4))
#define CV_STATE_EVAL(v2,v3,v4) CV_EVAL(STATE_OBJECT,(v2),(v3),(v4))
#define CV_TRANSITION_EVAL(v1,v2) cv_eval_point(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  TRANSITION_OBJECT,(v1),0,((v2)!=0))
#define CV_RELATIONAL_EVAL(v1,v2,v3,v4,v5,v6,v7)  cv_eval_relational(sfGlobalDebugInstanceStruct,_humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6),(v7))
#define CV_SATURATION_EVAL(v1,v2,v3,v4,v5)  cv_eval_saturation(sfGlobalDebugInstanceStruct,_humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5))
#define CV_SATURATION_ACCUM(v1,v2,v3,v4)  cv_saturation_accum(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4))
#define CV_TESTOBJECTIVE_EVAL(v1,v2,v3,v4)  cv_eval_testobjective(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4))

/* Coverage Macros for MATLAB  */
#define CV_EML_EVAL(v1,v2,v3,v4,v5) cv_eml_eval(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(int)(v5))
#define CV_EML_FCN(v2,v3) CV_EML_EVAL(CV_EML_FCN_CHECK,(v2),1,(v3),0)
#define CV_EML_TESTOBJECTIVE(v2,v3,v4,v5) CV_EML_EVAL(CV_EML_TESTOBJECTIVE_CHECK,(v2),(v3),(v4),((v5) != 0))
#define CV_EML_SATURATION(v2,v3,v4,v5) CV_EML_EVAL(CV_EML_SATURATION_CHECK,(v2),(v3),(v4),((v5) != 0))
#define CV_EML_SATURATION_ACCUM(v2,v3,v4,v5) CV_EML_EVAL(CV_EML_SATURATION_ACCUM_CHECK,(v2),(v3),(v4),(v5))
#define CV_EML_IF(v2,v3,v4,v5) CV_EML_EVAL(CV_EML_IF_CHECK,(v2),(v3),(v4),((v5) != 0))
#define CV_EML_FOR(v2,v3,v4,v5) CV_EML_EVAL(CV_EML_FOR_CHECK,(v2),(v3),(v4),(v5))
#define CV_EML_WHILE(v2,v3,v4,v5) CV_EML_EVAL(CV_EML_WHILE_CHECK,(v2),(v3),(v4),((v5) != 0))
#define CV_EML_SWITCH(v2,v3,v4,v5) CV_EML_EVAL(CV_EML_SWITCH_CHECK,(v2),(v3),(v4),(v5))
#define CV_EML_COND(v2,v3,v4,v5) CV_EML_EVAL(CV_EML_COND_CHECK,(v2),(v3),(v4),((v5) != 0))
#define CV_EML_MCDC(v2,v3,v4,v5) CV_EML_EVAL(CV_EML_MCDC_CHECK,(v2),(v3),(v4),(v5))
#define CV_SCRIPT_EVAL(v1,v2,v3,v4) cv_script_eval(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(int)(v4))
#define CV_SCRIPT_FCN(v2,v3) CV_SCRIPT_EVAL(CV_SCRIPT_FCN_CHECK,(v2),(v3),0)
#define CV_SCRIPT_TESTOBJECTIVE(v2,v3,v4) CV_SCRIPT_EVAL(CV_SCRIPT_TESTOBJECTIVE_CHECK,(v2),(v3),((v4) != 0))
#define CV_SCRIPT_SATURATION(v2,v3,v4) CV_SCRIPT_EVAL(CV_SCRIPT_SATURATION_CHECK,(v2),(v3),((v4) != 0))
#define CV_SCRIPT_SATURATION_ACCUM(v2,v3,v4) CV_SCRIPT_EVAL(CV_SCRIPT_SATURATION_ACCUM_CHECK,(v2),(v3),(v4))
#define CV_SCRIPT_IF(v2,v3,v4) CV_SCRIPT_EVAL(CV_SCRIPT_IF_CHECK,(v2),(v3),((v4) != 0))
#define CV_SCRIPT_FOR(v2,v3,v4) CV_SCRIPT_EVAL(CV_SCRIPT_FOR_CHECK,(v2),(v3),(v4))
#define CV_SCRIPT_WHILE(v2,v3,v4) CV_SCRIPT_EVAL(CV_SCRIPT_WHILE_CHECK,(v2),(v3),((v4) != 0))
#define CV_SCRIPT_SWITCH(v2,v3,v4) CV_SCRIPT_EVAL(CV_SCRIPT_SWITCH_CHECK,(v2),(v3),(v4))
#define CV_SCRIPT_COND(v2,v3,v4) CV_SCRIPT_EVAL(CV_SCRIPT_COND_CHECK,(v2),(v3),((v4) != 0))
#define CV_SCRIPT_MCDC(v2,v3,v4) CV_SCRIPT_EVAL(CV_SCRIPT_MCDC_CHECK,(v2),(v3),(v4))

#define _SFD_CV_INIT_EML(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11) cv_eml_init_script(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6),(v7),(v8),(v9),(v10),(v11))

#define _SFD_CV_INIT_EML_FCN(v1,v2,v3,v4,v5,v6) cv_eml_init_fcn(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6))

#define _SFD_CV_INIT_EML_TESTOBJECTIVE(v1,v2,v3,v4,v5,v6,v7) cv_eml_init_testobjective(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
       CHARTINSTANCE_CHARTNUMBER,\
       CHARTINSTANCE_INSTANCENUMBER,\
       (v1),(v2),(v3),(v4),(v5),(v6),(v7))

#define _SFD_CV_INIT_EML_SATURATION(v1,v2,v3,v4,v5,v6) cv_eml_init_saturation(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
       CHARTINSTANCE_CHARTNUMBER,\
       CHARTINSTANCE_INSTANCENUMBER,\
       (v1),(v2),(v3),(v4),(v5),(v6))

#define _SFD_CV_INIT_EML_IF(v1,v2,v3,v4,v5,v6,v7) cv_eml_init_if(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6),(v7))

#define _SFD_CV_INIT_EML_FOR(v1,v2,v3,v4,v5,v6) cv_eml_init_for(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6))

#define _SFD_CV_INIT_EML_WHILE(v1,v2,v3,v4,v5,v6) cv_eml_init_while(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6))

#define _SFD_CV_INIT_EML_MCDC(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11) cv_eml_init_mcdc(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6),(v7),(v8),(v9),(v10),(v11))

#define _SFD_CV_INIT_EML_RELATIONAL(v1,v2,v3,v4,v5,v6) cv_eml_init_relational(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6))

#define _SFD_CV_INIT_EML_SWITCH(v1,v2,v3,v4,v5,v6,v7,v8,v9) cv_eml_init_switch(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6),(v7),(v8),(v9))

#define _SFD_CV_INIT_SCRIPT(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10) cv_script_init_script(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6),(v7),(v8),(v9),(v10))

#define _SFD_CV_INIT_SCRIPT_FCN(v1,v2,v3,v4,v5,v6) cv_script_init_fcn(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6))

#define _SFD_CV_INIT_SCRIPT_TESTOBJECTIVE(v1,v2,v3,v4,v5,v6) cv_script_init_testobjective(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6))

#define _SFD_CV_INIT_SCRIPT_SATURATION(v1,v2,v3,v4,v5) cv_script_init_saturation(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
       CHARTINSTANCE_CHARTNUMBER,\
       CHARTINSTANCE_INSTANCENUMBER,\
       (v1),(v2),(v3),(v4),(v5))

#define _SFD_CV_INIT_SCRIPT_IF(v1,v2,v3,v4,v5,v6) cv_script_init_if(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6))

#define _SFD_CV_INIT_SCRIPT_FOR(v1,v2,v3,v4,v5) cv_script_init_for(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5))

#define _SFD_CV_INIT_SCRIPT_WHILE(v1,v2,v3,v4,v5) cv_script_init_while(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5))

#define _SFD_CV_INIT_SCRIPT_MCDC(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10) cv_script_init_mcdc(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6),(v7),(v8),(v9),(v10))

#define _SFD_CV_INIT_SCRIPT_RELATIONAL(v1,v2,v3,v4,v5) cv_script_init_relational(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5))

#define _SFD_CV_INIT_SCRIPT_SWITCH(v1,v2,v3,v4,v5,v6,v7,v8) cv_script_init_switch(sfGlobalDebugInstanceStruct, \
       _humanMovementTestMachineNumber_,\
		  CHARTINSTANCE_CHARTNUMBER,\
		  CHARTINSTANCE_INSTANCENUMBER,\
		  (v1),(v2),(v3),(v4),(v5),(v6),(v7),(v8))


#define _SFD_SET_DATA_PROPS(dataNumber,dataScope,isInputData,isOutputData,dataName)\
 sf_debug_set_chart_data_props(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,\
	(dataNumber),(dataScope),(isInputData),(isOutputData),(dataName))
#define _SFD_SET_DATA_COMPILED_PROPS(dataNumber,dataType,numDims,dimArray,isFixedPoint,isSigned,wordLength,bias,slope,exponent,complexity,mexOutFcn, mexInFcn)\
 sf_debug_set_chart_data_compiled_props(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,CHARTINSTANCE_INSTANCENUMBER,\
	(dataNumber),(dataType),(numDims),(dimArray),(isFixedPoint),(isSigned),(wordLength),(bias),(slope),(exponent),(complexity),(mexOutFcn),(mexInFcn))
#define _SFD_STATE_INFO(v1,v2,v3)\
	sf_debug_set_chart_state_info(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,(v1),(v2),(v3))
#define _SFD_CH_SUBSTATE_INDEX(v1,v2)\
	sf_debug_set_chart_substate_index(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,(v1),(v2))
#define _SFD_ST_SUBSTATE_INDEX(v1,v2,v3)\
   sf_debug_set_chart_state_substate_index(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,(v1),(v2),(v3))
#define _SFD_ST_SUBSTATE_COUNT(v1,v2)\
	sf_debug_set_chart_state_substate_count(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,(v1),(v2))
#define _SFD_DATA_CHANGE_EVENT_COUNT(v1,v2) \
	sf_debug_set_number_of_data_with_change_event_for_chart(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,\
	(v1),(v2))
#define _SFD_STATE_ENTRY_EVENT_COUNT(v1,v2) \
	sf_debug_set_number_of_states_with_entry_event_for_chart(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,\
	(v1),(v2))
#define _SFD_STATE_EXIT_EVENT_COUNT(v1,v2) \
	sf_debug_set_number_of_states_with_exit_event_for_chart(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,\
	(v1),(v2))
#define _SFD_EVENT_SCOPE(v1,v2)\
	sf_debug_set_chart_event_scope(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
	CHARTINSTANCE_CHARTNUMBER,(v1),(v2))

#define _SFD_CH_SUBSTATE_COUNT(v1) \
	sf_debug_set_chart_substate_count(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,(v1))
#define _SFD_CH_SUBSTATE_DECOMP(v1) \
	sf_debug_set_chart_decomposition(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,(v1))

#define _SFD_CV_INIT_CHART(v1,v2,v3,v4)\
 sf_debug_cv_init_chart(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,\
	CHARTINSTANCE_INSTANCENUMBER,(v1),(v2),(v3),(v4))

#define _SFD_CV_INIT_STATE(v1,v2,v3,v4,v5,v6,v7,v8)\
	sf_debug_cv_init_state(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,CHARTINSTANCE_CHARTNUMBER,\
	CHARTINSTANCE_INSTANCENUMBER,(v1),(v2),(v3),(v4),(v5),(v6),(v7),(v8))

#define _SFD_CV_INIT_TRANSITION_SATURATION(v1,v2,v3,v4)\
     sf_debug_cv_init_saturation(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
	  CHARTINSTANCE_CHARTNUMBER,\
	  CHARTINSTANCE_INSTANCENUMBER,\
	  TRANSITION_OBJECT,(v1),(v2),(v3),(v4))

#define _SFD_CV_INIT_TRANSITION_RELATIONALOP(v1,v2,v3,v4,v5)\
     sf_debug_cv_init_relationalop(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
	  CHARTINSTANCE_CHARTNUMBER,\
	  CHARTINSTANCE_INSTANCENUMBER,\
	  TRANSITION_OBJECT,(v1),(v2),(v3),(v4),(v5))

#define _SFD_CV_INIT_STATE_SATURATION(v1,v2,v3,v4)\
     sf_debug_cv_init_saturation(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
	  CHARTINSTANCE_CHARTNUMBER,\
	  CHARTINSTANCE_INSTANCENUMBER,\
	  STATE_OBJECT, (v1),(v2),(v3),(v4))

#define _SFD_CV_INIT_TRANSITION_TESTOBJECTIVE(v1,v2,v3,v4)\
     sf_debug_cv_init_testobjectives(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
	  CHARTINSTANCE_CHARTNUMBER,\
	  CHARTINSTANCE_INSTANCENUMBER,\
	  TRANSITION_OBJECT,(v1),(v2),(v3),(v4))

#define _SFD_CV_INIT_STATE_TESTOBJECTIVE(v1,v2,v3,v4)\
     sf_debug_cv_init_testobjectives(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
	  CHARTINSTANCE_CHARTNUMBER,\
	  CHARTINSTANCE_INSTANCENUMBER,\
	  STATE_OBJECT, (v1),(v2),(v3),(v4))

#define _SFD_CV_INIT_TRANS(v1,v2,v3,v4,v5,v6)\
     sf_debug_cv_init_trans(sfGlobalDebugInstanceStruct, _humanMovementTestMachineNumber_,\
	  CHARTINSTANCE_CHARTNUMBER,\
	  CHARTINSTANCE_INSTANCENUMBER,\
	  (v1),(v2),(v3),(v4),(v5),(v6))
#endif

#define _SFD_SET_MACHINE_DATA_VALUE_PTR(v0,v1,v2) sf_debug_set_machine_data_value_ptr(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_STORE_CURRENT_STATE_CONFIGURATION(v0,v1,v2) sf_debug_store_current_state_configuration(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_RESTORE_PREVIOUS_STATE_CONFIGURATION(v0,v1,v2) sf_debug_restore_previous_state_configuration(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_RESTORE_PREVIOUS_STATE_CONFIGURATION2(v0,v1,v2) sf_debug_restore_previous_state_configuration2(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_SYMBOL_SCOPE_PUSH(v0,v1) sf_debug_symbol_scope_push(sfGlobalDebugInstanceStruct,v0,v1)
#define _SFD_SYMBOL_SCOPE_PUSH_EML(v0,v1,v2,v3,v4) sf_debug_symbol_scope_push_eml(sfGlobalDebugInstanceStruct,v0,v1,v2,v3,v4)
#define _SFD_SYMBOL_SCOPE_POP() sf_debug_symbol_scope_pop(sfGlobalDebugInstanceStruct)
#define _SFD_SYMBOL_SCOPE_ADD(v0,v1,v2) sf_debug_symbol_scope_add(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_SYMBOL_SCOPE_ADD_IMPORTABLE(v0,v1,v2,v3) sf_debug_symbol_scope_add_importable(sfGlobalDebugInstanceStruct,v0,v1,v2,v3)
#define _SFD_SYMBOL_SCOPE_ADD_EML(v0,v1,v2) sf_debug_symbol_scope_add_eml(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(v0,v1,v2,v3) sf_debug_symbol_scope_add_eml_importable(sfGlobalDebugInstanceStruct,v0,v1,v2,v3)
#define _SFD_SYMBOL_SCOPE_ADD_DYN(v0,v1,v2,v3,v4,v5) sf_debug_symbol_scope_add_dyn(sfGlobalDebugInstanceStruct,v0,v1,v2,v3,v4,v5)
#define _SFD_SYMBOL_SCOPE_ADD_DYN_IMPORTABLE(v0,v1,v2,v3,v4,v5,v6) sf_debug_symbol_scope_add_dyn_importable(sfGlobalDebugInstanceStruct,v0,v1,v2,v3,v4,v5,v6)
#define _SFD_SYMBOL_SCOPE_ADD_EML_DYN(v0,v1,v2,v3,v4,v5) sf_debug_symbol_scope_add_eml_dyn(sfGlobalDebugInstanceStruct,v0,v1,v2,v3,v4,v5)
#define _SFD_SYMBOL_SCOPE_ADD_EML_DYN_IMPORTABLE(v0,v1,v2,v3,v4,v5,v6) sf_debug_symbol_scope_add_eml_dyn_importable(sfGlobalDebugInstanceStruct,v0,v1,v2,v3,v4,v5,v6)
#define _SFD_SYMBOL_SCOPE_ADD_VERBOSE(v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14) sf_debug_symbol_scope_add_verbose(sfGlobalDebugInstanceStruct,v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14)
#define _SFD_SYMBOL_SWITCH(v0,v1) sf_debug_symbol_switch(sfGlobalDebugInstanceStruct,v0,v1)
#define _SFD_CHECK_FOR_STATE_INCONSISTENCY(v0,v1,v2) sf_debug_check_for_state_inconsistency(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_SET_HONOR_BREAKPOINTS(v0) sf_debug_set_honor_breakpoints(sfGlobalDebugInstanceStruct, v0)
#define _SFD_GET_ANIMATION() sf_debug_get_animation(sfGlobalDebugInstanceStruct)
#define _SFD_SET_ANIMATION(v0) sf_debug_set_animation(sfGlobalDebugInstanceStruct,v0)
#define _SFD_SIZE_EQ_CHECK_1D(v0,v1) sf_debug_size_eq_check_1d(sfGlobalDebugInstanceStruct,v0,v1)
#define _SFD_SIZE_EQ_CHECK_ND(v0,v1,v2) sf_debug_size_eq_check_nd(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_DIM_SIZE_EQ_CHECK(v0,v1,v2) sf_debug_dim_size_eq_check(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_DIM_SIZE_GEQ_CHECK(v0,v1,v2) sf_debug_dim_size_geq_check(sfGlobalDebugInstanceStruct,v0,v1,v2)
#define _SFD_SUB_ASSIGN_SIZE_CHECK_ND(v0,v1,v2,v3) sf_debug_sub_assign_size_check_nd(sfGlobalDebugInstanceStruct,v0,v1,v2,v3)
#define _SFD_MATRIX_MATRIX_INDEX_CHECK(v0,v1,v2,v3) sf_debug_matrix_matrix_index_check(sfGlobalDebugInstanceStruct,v0,v1,v2,v3)
#define _SFD_VECTOR_VECTOR_INDEX_CHECK(v0,v1,v2,v3) sf_debug_vector_vector_index_check(sfGlobalDebugInstanceStruct,v0,v1,v2,v3)
#define _SFD_FOR_LOOP_VECTOR_CHECK(v0,v1,v2,v3,v4) sf_debug_for_loop_vector_check(sfGlobalDebugInstanceStruct,v0,v1,v2,v3,v4)
#define _SFD_RUNTIME_ERROR_MSGID(v0) sf_debug_runtime_error_msgid(sfGlobalDebugInstanceStruct,v0)
#define _SFD_TRANSITION_CONFLICT_CHECK_ENABLED() sf_debug_transition_conflict_check_enabled(sfGlobalDebugInstanceStruct)
#define _SFD_TRANSITION_CONFLICT_CHECK_BEGIN() sf_debug_transition_conflict_check_begin(sfGlobalDebugInstanceStruct)
#define _SFD_TRANSITION_CONFLICT_CHECK_END() sf_debug_transition_conflict_check_end(sfGlobalDebugInstanceStruct)
#define _SFD_OVERFLOW_DETECTION(v0) sf_debug_overflow_detection(sfGlobalDebugInstanceStruct,v0)
