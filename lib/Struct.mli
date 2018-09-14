(** Mapping from JS Object to OCaml records *)

module Versions : 
sig 

  type t = {
    chrome : string (** Resolve the chrome version *)
  ; electron : string (** Resolve the electron version *)
  }

  val from_object : Binding.versions Js.t -> t
  (** Converts [Binding.versions] to [t] *)

end

module CPUUsage : 
sig 

  type t = {
    percent_cpu_usage : int (** Percentage of CPU used since 
                                the last call to getCPUUsage 
                            *)
  ; idle_wakeups_per_second : int (** The number of average idle cpu wakeups 
                                      per second since the last call to getCPUUsage *)
  }

  val from_object : Binding.cpu_usage Js.t -> t

end

module IOCounter : 
sig 

  type t = {
    read_operation_count  : int (** The number of I/O read operations. *)
  ; write_operation_count : int (** The number of I/O write operations. *)
  ; other_operation_count : int (** The number of I/O other operations. *)
  ; read_transfer_count   : int (** The number of I/O read transfers. *)
  ; write_transfer_count  : int (** The number of I/O write transfers. *)
  ; other_transfer_count  : int (** Then number of I/O other transfers. *)
  }

  val from_object : Binding.io_counter Js.t -> t

end
