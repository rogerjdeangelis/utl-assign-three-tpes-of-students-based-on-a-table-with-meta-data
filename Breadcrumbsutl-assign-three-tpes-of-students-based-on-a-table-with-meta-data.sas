%let pgm=utl-assign-three-tpes-of-students-based-on-a-table-with-meta-data;

Problem
   Assign three types of students base on a table with meta data;


github
https://tinyurl.com/3temm8rn
https://github.com/rogerjdeangelis/utl-assign-three-tpes-of-students-based-on-a-table-with-meta-data

Macro array and do_over

https://tinyurl.com/58pp9nz6
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories
Authors: Ted Clay, M.S.
  Clay Software & Statistics
  tclay@ashlandhome.net  (541) 482-6435
  David Katz, M.S. www.davidkatzconsulting.com

Related repos on end

/*                   _
(_)_ __  _ __  _   _| |_ ___
| | `_ \| `_ \| | | | __/ __|
| | | | | |_) | |_| | |_\__ \
|_|_| |_| .__/ \__,_|\__|___/
        |_|
*/

libname sd1 "d:/sd1";

data sd1.meta;
input;
  lyn=_infile_;
cards4;
when (age <12) type=1
when (13 < age <16) type=2
otherwise type=3
;;;;
run;quit;

data sd1.have;
  set sashelp.class(keep=name age);
run;quit;


/**************************************************************************************************************************/
/* SORTED FOR DOCUMENTATION  |                              |                                                             */
/* PURPOSES ONLY             |                              |                                                             */
/*                           |                              |                                                             */
/* INPUT (SD1.HAVE)          |  PROCESS (SD1.META)          |  OUTPUT                                                     */
/*                           |                              |                                                             */
/* Obs    NAME       AGE     |                              |  NAME       AGE    TYPE                                     */
/*                           |                              |                                                             */
/*   1    Joyce       11     |  when (age <12) type=1       |  Joyce       11      1   when (age <12) type=1              */
/*   2    Thomas      11     |  when (13 < age <16) type=2  |  Thomas      11      1                                      */
/*   3    Alfred      14     |  otherwise type=3            |                                                             */
/*   4    Carol       14     |                              |  Alfred      14      2   when (13 < age <16) type=2         */
/*   5    Henry       14     |                              |  Carol       14      2                                      */
/*   6    Janet       15     |                              |  Henry       14      2                                      */
/*   7    Judy        14     |                              |  Janet       15      2                                      */
/*   8    Mary        15     |                              |  Judy        14      2                                      */
/*   9    Ronald      15     |                              |  Mary        15      2                                      */
/*  10    William     15     |                              |  Ronald      15      2                                      */
/*  11    Alice       13     |                              |  William     15      2                                      */
/*  12    Barbara     13     |                              |                                                             */
/*  13    James       12     |                              |  Alice       13      3  otherwise type=3                    */
/*  14    Jane        12     |                              |  Barbara     13      3                                      */
/*  15    Jeffrey     13     |                              |  James       12      3                                      */
/*  16    John        12     |                              |  Jane        12      3                                      */
/*  17    Louise      12     |                              |  Jeffrey     13      3                                      */
/*  18    Philip      16     |                              |  John        12      3                                      */
/*  19    Robert      12     |                              |  Louise      12      3                                      */
/*                           |                              |  Philip      16      3                                      */
/**************************************************************************************************************************/

%array(_st,data=sd1.meta,var=lyn);

%utl_submit_wps64x("

libname sd1 'd:/sd1';

data want;

  set sd1.have;

  select;
     %do_over(_st,between=%str(;));
  end;

keep name age type;

run;quit;

proc print;
run;quit;

");

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  The WPS System                                                                                                        */
/*                                                                                                                        */
/*  Obs     NAME      AGE    TYPE                                                                                         */
/*                                                                                                                        */
/*    1    Alfred      14      2                                                                                          */
/*    2    Alice       13      3                                                                                          */
/*    3    Barbara     13      3                                                                                          */
/*    4    Carol       14      2                                                                                          */
/*    5    Henry       14      2                                                                                          */
/*    6    James       12      3                                                                                          */
/*    7    Jane        12      3                                                                                          */
/*    8    Janet       15      2                                                                                          */
/*    9    Jeffrey     13      3                                                                                          */
/*   10    John        12      3                                                                                          */
/*   11    Joyce       11      1                                                                                          */
/*   12    Judy        14      2                                                                                          */
/*   13    Louise      12      3                                                                                          */
/*   14    Mary        15      2                                                                                          */
/*   15    Philip      16      3                                                                                          */
/*   16    Robert      12      3                                                                                          */
/*   17    Ronald      15      2                                                                                          */
/*   18    Thomas      11      1                                                                                          */
/*   19    William     15      2                                                                                          */
/*                                                                                                                        */
/**************************************************************************************************************************/
/*
 _ __ ___ _ __   ___  ___
| `__/ _ \ `_ \ / _ \/ __|
| | |  __/ |_) | (_) \__ \
|_|  \___| .__/ \___/|___/
         |_|
*/
https://github.com/rogerjdeangelis/utl-applying-meta-data-and-dosubl-to-create-mutiple-subset-tables
https://github.com/rogerjdeangelis/utl-applying-meta-data-and-importing-data-from-an-excel-named-range
https://github.com/rogerjdeangelis/utl-create-a-sas-table-with-meta-data-and-no-observations
https://github.com/rogerjdeangelis/utl-dosubl-using-meta-data-with-column-names-and-labels-to-create-mutiple-proc-reports
https://github.com/rogerjdeangelis/utl-enhanced-common-meta-data-model-to-reduce-CDSIC-mapping-efforts
https://github.com/rogerjdeangelis/utl-extracting-sas-meta-data-using-sas-macro-fcmp-and-dosubl
https://github.com/rogerjdeangelis/utl-import-multiple-text-files-usingg-meta-data-in-a-sas-table
https://github.com/rogerjdeangelis/utl-load-and-extract-ms-excel-document-properties-metadata
https://github.com/rogerjdeangelis/utl-reduce-your-sdtm-and-adam-mapping-effort-using-a-common-meta-data-model
https://github.com/rogerjdeangelis/utl-simple-example-of-meta-regression-using-SAS-and-R
https://github.com/rogerjdeangelis/utl-transposing-into-variable-value-pairs-and-adding-meta-data
https://github.com/rogerjdeangelis/utl-using-intermediate-files-when-meta-data-is-mixed-in-with-your-data-do_over
https://github.com/rogerjdeangelis/utl-using-meta-data-in-one-table-to-subset-data-in-another-table
https://github.com/rogerjdeangelis/utl-using-meta-data-to-create-customized-sas-tables-do-over
https://github.com/rogerjdeangelis/utl_create_matrices_using_variable_names_in_meta_data
https://github.com/rogerjdeangelis/utl_data_driven_programming_applying_attributes_to_tables_using_meta_data
https://github.com/rogerjdeangelis/utl_given_meta_data_with_mutiple_filepaths_and_accounts_create_an_xml_file_for_each_filepath_and_acc
https://github.com/rogerjdeangelis/utl_import_sas_dataset_meta_into_r_data_using_the_free_wps_express
https://github.com/rogerjdeangelis/utl_table_driven_processing_or_using_meta_data_to_drive_sql_processing
https://github.com/rogerjdeangelis/utl_using_meta_data_add_column_average_height_to_each_table_in_a_sas_data_library


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
