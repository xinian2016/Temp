#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��GWstart.sh ���N�@���)~�]�h�6��c��C�DZ3�A"Q"H�х�!h�׺0qC�i�-+_���� g��%���91�b^�44x>���Y)�ʤdE.�Λ�~F� �{t����EY��6���A�����}29Y�1A*GL#�M*+�yXk��w���w[n�K��,a=���Z��YDR��)���vz3({&&���[�S�7�3��d2,-H��_qy���h��S��-Væ;�ج��ԣ���0�I�����HCEF�E��ba��R�V`!t�@U��ġݐ���ei��ETL���T"6M�f����Q���~��
�����A��?����}眭'e'�_�Y_N�ϥ  