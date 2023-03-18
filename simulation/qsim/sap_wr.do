onerror {exit -code 1}
vlib work
vlog -work work sap_wr.vo
vlog -work work cp_instruction_register.vwf.vt
vsim -novopt -c -t 1ps -L fiftyfivenm_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.cp_instruction_register_vlg_vec_tst
vcd file -direction sap_wr.msim.vcd
vcd add -internal cp_instruction_register_vlg_vec_tst/*
vcd add -internal cp_instruction_register_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f

