open Prims
type 'Aa seq =
  | MkSeq of 'Aa Prims.list
let uu___is_MkSeq projectee = true
let __proj__MkSeq__item__l projectee = match projectee with | MkSeq l -> l
let length s = FStar_List_Tot_Base.length (__proj__MkSeq__item__l s)
let index s i = FStar_List_Tot_Base.index (__proj__MkSeq__item__l s) i
let cons x s = MkSeq (x :: (__proj__MkSeq__item__l s))
let hd s = FStar_List_Tot_Base.hd (__proj__MkSeq__item__l s)
let tl s = MkSeq (FStar_List_Tot_Base.tl (__proj__MkSeq__item__l s))
let rec create len v =
  if len = (Prims.parse_int "0")
  then MkSeq []
  else cons v (create (len - (Prims.parse_int "1")) v)
let rec init_aux len k contents =
  if (k + (Prims.parse_int "1")) = len
  then MkSeq [contents k]
  else cons (contents k) (init_aux len (k + (Prims.parse_int "1")) contents)
let rec init len contents =
  if len = (Prims.parse_int "0")
  then MkSeq []
  else init_aux len (Prims.parse_int "0") contents
let of_list l = MkSeq l
let lemma_of_list_length s l = ()
let lemma_of_list s l i = ()
let exFalso0 = Obj.magic (fun n  -> ())
let createEmpty uu____335 = MkSeq []
let rec upd s n v =
  if n = (Prims.parse_int "0")
  then cons v (tl s)
  else cons (hd s) (upd (tl s) (n - (Prims.parse_int "1")) v)
let append s1 s2 =
  MkSeq
    (FStar_List_Tot_Base.append (__proj__MkSeq__item__l s1)
       (__proj__MkSeq__item__l s2))
let op_At_Bar s1 s2 = append s1 s2
let rec slice s i j =
  if i > (Prims.parse_int "0")
  then slice (tl s) (i - (Prims.parse_int "1")) (j - (Prims.parse_int "1"))
  else
    if j = (Prims.parse_int "0")
    then MkSeq []
    else cons (hd s) (slice (tl s) i (j - (Prims.parse_int "1")))
let rec lemma_create_len n i = ()
let rec lemma_init_aux_len n k contents = ()
let rec lemma_init_len n contents = ()
let rec lemma_len_upd n v s = ()
let lemma_len_append s1 s2 = ()
let rec lemma_len_slice s i j = ()
let rec lemma_index_create n v i = ()
let rec lemma_index_upd1 s n v = ()
let rec lemma_index_upd2 s n v i = ()
let rec lemma_index_app1 s1 s2 i = ()
let rec lemma_index_app2 s1 s2 i = ()
let rec lemma_index_slice s i j k = ()
let hasEq_lemma = ()
type ('Aa,'As1,'As2) equal = Prims.unit
let rec eq_i s1 s2 i =
  if i = (length s1)
  then true
  else
    if (index s1 i) = (index s2 i)
    then eq_i s1 s2 (i + (Prims.parse_int "1"))
    else false
let eq s1 s2 =
  if (length s1) = (length s2)
  then eq_i s1 s2 (Prims.parse_int "0")
  else false
let lemma_eq_intro s1 s2 = ()
let lemma_eq_refl s1 s2 = ()
let lemma_eq_elim s1 s2 = ()
let append_assoc s1 s2 s3 = ()
let append_empty_l s = ()
let append_empty_r s = ()
let rec init_index_aux len k contents = ()
let init_index len contents = ()