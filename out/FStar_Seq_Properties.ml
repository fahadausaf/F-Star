open Prims
type ('Aa,'As,'Aj) indexable = Prims.unit
let lemma_append_inj_l s1 s2 t1 t2 i = ()
let lemma_append_inj_r s1 s2 t1 t2 i = ()
let lemma_append_len_disj s1 s2 t1 t2 = ()
let lemma_append_inj s1 s2 t1 t2 = ()
let head s = FStar_Seq_Base.index s (Prims.parse_int "0")
let tail s =
  FStar_Seq_Base.slice s (Prims.parse_int "1") (FStar_Seq_Base.length s)
let lemma_head_append s1 s2 = ()
let lemma_tail_append s1 s2 = ()
let last s =
  FStar_Seq_Base.index s ((FStar_Seq_Base.length s) - (Prims.parse_int "1"))
let cons x s =
  FStar_Seq_Base.append (FStar_Seq_Base.create (Prims.parse_int "1") x) s
let lemma_cons_inj v1 v2 s1 s2 = ()
let split s i =
  ((FStar_Seq_Base.slice s (Prims.parse_int "0") i),
    (FStar_Seq_Base.slice s i (FStar_Seq_Base.length s)))
let lemma_split s i = ()
let split_eq s i = split s i
let rec count x s =
  if (FStar_Seq_Base.length s) = (Prims.parse_int "0")
  then Prims.parse_int "0"
  else
    if (head s) = x
    then (Prims.parse_int "1") + (count x (tail s))
    else count x (tail s)
let mem x l = (count x l) > (Prims.parse_int "0")
let swap s i j =
  FStar_Seq_Base.upd (FStar_Seq_Base.upd s j (FStar_Seq_Base.index s i)) i
    (FStar_Seq_Base.index s j)
let lemma_slice_append s1 s2 = ()
let rec lemma_slice_first_in_append s1 s2 i = ()
let slice_upd s i j k v = ()
let upd_slice s i j k v = ()
let rec lemma_append_cons s1 s2 = ()
let lemma_tl hd1 tl1 = ()
let rec sorted f s =
  if (FStar_Seq_Base.length s) <= (Prims.parse_int "1")
  then true
  else
    (f (head s) (FStar_Seq_Base.index s (Prims.parse_int "1"))) &&
      (sorted f (tail s))
let rec lemma_append_count lo hi = ()
let lemma_append_count_aux x lo hi = ()
let lemma_mem_inversion s = ()
let rec lemma_mem_count s f = ()
let lemma_count_slice s i = ()
type ('Aa,'Af) total_order = Prims.unit
type 'Aa tot_ord = 'Aa -> 'Aa -> Prims.bool
let rec sorted_concat_lemma f lo pivot hi = ()
let split_5 s i j =
  match split_eq s i with
  | (frag_lo,rest) ->
      (match split_eq rest (Prims.parse_int "1") with
       | (frag_i,rest1) ->
           (match split_eq rest1 (j - (i + (Prims.parse_int "1"))) with
            | (frag_mid,rest2) ->
                (match split_eq rest2 (Prims.parse_int "1") with
                 | (frag_j,frag_hi) ->
                     FStar_Seq_Base.upd
                       (FStar_Seq_Base.upd
                          (FStar_Seq_Base.upd
                             (FStar_Seq_Base.upd
                                (FStar_Seq_Base.create (Prims.parse_int "5")
                                   frag_lo) (Prims.parse_int "1") frag_i)
                             (Prims.parse_int "2") frag_mid)
                          (Prims.parse_int "3") frag_j) (Prims.parse_int "4")
                       frag_hi)))
let lemma_swap_permutes_aux_frag_eq s i j i' j' = ()
let lemma_swap_permutes_aux s i j x = ()
type ('Aa,'As1,'As2) permutation = Prims.unit
let lemma_swap_permutes s i j = ()
let cons_perm tl1 s = ()
let lemma_mem_append s1 s2 = ()
let lemma_slice_cons s i j = ()
let lemma_slice_snoc s i j = ()
let lemma_ordering_lo_snoc f s i j pv = ()
let lemma_ordering_hi_cons f s back len pv = ()
let swap_frame_lo s lo i j = ()
let swap_frame_lo' s lo i' i j = ()
let swap_frame_hi s i j k hi = ()
let lemma_swap_slice_commute s start i j len = ()
let lemma_swap_permutes_slice s start i j len = ()
let splice s1 i s2 j =
  FStar_Seq_Base.append (FStar_Seq_Base.slice s1 (Prims.parse_int "0") i)
    (FStar_Seq_Base.append (FStar_Seq_Base.slice s2 i j)
       (FStar_Seq_Base.slice s1 j (FStar_Seq_Base.length s1)))
let splice_refl s i j = ()
let lemma_swap_splice s start i j len = ()
let lemma_seq_frame_hi s1 s2 i j m n = ()
let lemma_seq_frame_lo s1 s2 i j m n = ()
let lemma_tail_slice s i j = ()
let lemma_weaken_frame_right s1 s2 i j k = ()
let lemma_weaken_frame_left s1 s2 i j k = ()
let lemma_trans_frame s1 s2 s3 i j = ()
let lemma_weaken_perm_left s1 s2 i j k = ()
let lemma_weaken_perm_right s1 s2 i j k = ()
let lemma_trans_perm s1 s2 s3 i j = ()
let snoc s x =
  FStar_Seq_Base.append s (FStar_Seq_Base.create (Prims.parse_int "1") x)
let lemma_cons_snoc hd1 s tl1 = ()
let lemma_tail_snoc s x = ()
let lemma_snoc_inj s1 s2 v1 v2 = ()
let lemma_mem_snoc s x = ()
let rec find_l f l =
  if (FStar_Seq_Base.length l) = (Prims.parse_int "0")
  then FStar_Pervasives_Native.None
  else
    if f (head l)
    then FStar_Pervasives_Native.Some (head l)
    else find_l f (tail l)
let rec find_append_some s1 s2 f = ()
let rec find_append_none s1 s2 f = ()
let rec find_append_none_s2 s1 s2 f = ()
let find_snoc s x f = ()
let un_snoc s =
  match split s ((FStar_Seq_Base.length s) - (Prims.parse_int "1")) with
  | (s1,a) -> (s1, (FStar_Seq_Base.index a (Prims.parse_int "0")))
let rec find_r f l =
  if (FStar_Seq_Base.length l) = (Prims.parse_int "0")
  then FStar_Pervasives_Native.None
  else
    (match un_snoc l with
     | (prefix,last1) ->
         if f last1
         then FStar_Pervasives_Native.Some last1
         else find_r f prefix)
type 'Ai found = Prims.unit
let rec seq_find_aux f l ctr =
  match ctr with
  | _0_2 when _0_2 = (Prims.parse_int "0") -> FStar_Pervasives_Native.None
  | uu____3546 ->
      if f (FStar_Seq_Base.index l (ctr - (Prims.parse_int "1")))
      then
        FStar_Pervasives_Native.Some
          (FStar_Seq_Base.index l (ctr - (Prims.parse_int "1")))
      else seq_find_aux f l (ctr - (Prims.parse_int "1"))
let seq_find f l = seq_find_aux f l (FStar_Seq_Base.length l)
let rec seq_mem_k s n = ()
let rec seq_to_list s =
  if (FStar_Seq_Base.length s) = (Prims.parse_int "0")
  then []
  else (FStar_Seq_Base.index s (Prims.parse_int "0")) ::
    (seq_to_list
       (FStar_Seq_Base.slice s (Prims.parse_int "1")
          (FStar_Seq_Base.length s)))
let rec seq_of_list l =
  match l with
  | [] -> FStar_Seq_Base.createEmpty ()
  | hd1::tl1 ->
      FStar_Seq_Base.op_At_Bar
        (FStar_Seq_Base.create (Prims.parse_int "1") hd1) (seq_of_list tl1)
let rec lemma_seq_list_bij s = ()
let rec lemma_list_seq_bij l = ()
type ('Aa,'Al,'As) createL_post = Prims.unit
let createL l = seq_of_list l
let rec lemma_index_is_nth s i = ()
type ('Aa,'As,'Ax) contains = Prims.unit
let contains_intro s k x = ()
let contains_elim s x = ()
let lemma_contains_empty = ()
let lemma_contains_singleton x = ()
let intro_append_contains_from_disjunction s1 s2 x = ()
let append_contains_equiv s1 s2 x = ()
let contains_snoc s x = ()
let rec lemma_find_l_contains f l = ()
let contains_cons hd1 tl1 x = ()
let append_cons_snoc u x v = ()
let append_slices s1 s2 = ()
let rec find_l_none_no_index s f = ()
type ('Aa,'As_suff,'As) suffix_of = Prims.unit
let cons_head_tail s = ()
let head_cons x s = ()
let suffix_of_tail s = ()
let index_cons_l c s = ()
let index_cons_r c s i = ()
let append_cons c s1 s2 = ()
let index_tail s i = ()
let mem_cons x s = ()
let snoc_slice_index s i j = ()
let cons_index_slice s i j = ()
let slice_is_empty s i = ()
let slice_length s = ()
let slice_slice s i1 j1 i2 j2 = ()
let seq_of_list_tl l = ()
let rec mem_seq_of_list x l = ()