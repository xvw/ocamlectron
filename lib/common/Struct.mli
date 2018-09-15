(** Mapping from JS Object to OCaml records *)

open Binding

module Versions : 
sig 

  type t = {
    chrome : string (** Resolve the chrome version *)
  ; electron : string (** Resolve the electron version *)
  }

  val from_object : Versions.t -> t
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

  val from_object : CPUUsage.t -> t
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

  val from_object : IOCounter.t -> t
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

  val from_object : ProcessMemoryInfo.t -> t 
  (** Converts [Binding.process_memory_info] to [t] *)

end

module SystemMemoryInfo : 
sig 

  type t = {
    total : int (** The total amount of physical memory in Kilobytes available 
                    to the system. 
                *)
  ; free : int (** The total amount of memory not being used by applications 
                   or disk cache. 
               *)
  ; swap_total : int (** The total amount of swap memory in Kilobytes available 
                         to the system. {b only Windows and Linux} 
                     *)
  ; swap_free : int (** The free amount of swap memory in Kilobytes 
                        available to the system. {b only Windows and Linux} 
                    *)
  }

  val from_object : SystemMemoryInfo.t -> t
  (** Converts [Binding.system_memory_info] to [t] *)

end

module MemoryUsage : 
sig 

  type t = {
    rss : int 
  ; heap_total : int 
  ; heap_used : int 
  ; external_ : int
  }

  val from_object : MemoryUsage.t -> t
  (** Converts [Binding.memory_usage] to [t] *)

end

module Release : 
sig 

  type lts = 
    | Argon  (** for the 4.x LTS line beginning with 4.2.0. *)
    | Boron  (** for the 6.x LTS line beginning with 6.9.0. *)
    | Carbon (** for the 8.x LTS line beginning with 8.9.1. *)
    | Unknown of string

  type t = {
    name : string (** A value that will always be ['node'] for Node.js. 
                      For legacy io.js releases, this will be ['io.js']. 
                  *)
  ; source_url : string (** an absolute URL pointing to a [.tar.gz] file containing
                            the source code of the current release. 
                        *)
  ; headers_url : string  (** an absolute URL pointing to a [.tar.gz] file 
                              containing only the source header files for the 
                              current release. 

                              This file is significantly smaller than the full 
                              source file and can be used for compiling Node.js
                              native add-ons. 
                          *)

  ; lib_url : string option (**  an absolute URL pointing to a node.lib file matching 
                                 the architecture and version of the current release. 
                                 This file is used for compiling Node.js native add-ons. 
                                 This property is only present on Windows builds of Node.js 
                                 and will be missing on all other platforms. 
                            *)

  ; lts : lts option (** a string label identifying the LTS label for this release. 
                         This property only exists for LTS releases and is undefined for 
                         all other release types, including Current releases. 
                     *)
  }

  val lts_from_string : string -> lts
  (** Converts a [string] to an [lts] *)

  val from_object : Release.t -> t
  (** Converts [Binding.release] to [t] *)

end

module Task : 
sig 

  type t = {
    program : string (** Path of the program to execute, usually you 
                         should specify [process.execPath] which opens 
                         the current program 
                     *)

  ; arguments : string  (** The command line arguments when [program] 
                            is executed. 
                        *)

  ; title : string (** The string to be displayed in a [JumpList]. *)
  ; description : string (** Description of this task. *)

  ; icon_path : string (** The absolute path to an icon to be 
                           displayed in a [JumpList], which can be an 
                           arbitrary resource file that contains an icon. 
                           You can usually specify [process.execPath] to 
                           show the icon of the program. 
                       *)

  ; icon_index : int (** The icon index in the icon file. 
                         If an icon file consists of two or more icons, 
                         set this value to identify the icon. 
                         If an icon file consists of one icon, 
                         this value is 0. 
                     *)

  }

  val to_object : t -> Task.t
  (** Converts [t] to [Binding.task] *)

  val from_object : Task.t -> t 
  (** Converts [Binding.task] to [t] *)

end