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
  (** Converts [Binding.cpu_usage] to [t] *)

end

module IOCounters : 
sig 

  type t = {
    read_operation_count  : int (** The number of I/O read operations. *)
  ; write_operation_count : int (** The number of I/O write operations. *)
  ; other_operation_count : int (** The number of I/O other operations. *)
  ; read_transfer_count   : int (** The number of I/O read transfers. *)
  ; write_transfer_count  : int (** The number of I/O write transfers. *)
  ; other_transfer_count  : int (** Then number of I/O other transfers. *)
  }

  val from_object : Binding.io_counters Js.t -> t
  (** Converts [Binding.io_counters] to [t] *)

end

module ProcessMemoryInfo : 
sig 

  type t = {
    working_set_size : int (** The amount of memory currently pinned to actual 
                               physical RAM. 
                           *)
  ; peak_working_set_size : int (** The maximum amount of memory that has ever been 
                                    pinned to actual physical RAM. 
                                *)
  ; private_bytes : int (** The amount of memory not shared by other processes, 
                            such as JS heap or HTML content. 
                        *)
  ; shared_bytes : int (** The amount of memory shared between processes, typically
                           memory consumed by the Electron code itself. 
                       *)
  }

  val from_object : Binding.process_memory_info Js.t -> t 
  (** Converts [Binding.process_memory_info] to [t] *)

end
