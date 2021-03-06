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
�ciWstart.sh ���N�@���)~+]@/h�6��c�.�m"-i�w�H�Rbt�n��.L�}�i����@[$
ƙdn�|�fqA�i���Z*��<��1|ZL$R	I�J�y��g�~���Z��8i�H����v�59N����2�	b)d�SXYYY���j�=��6�6�~��i�zx�D��������:�~���͠���2�oR�Fn^g T6 �ӊ�J�jA2	|t��!�Q8�"���(a��b6-��6���O=r��Ú��XQ5�@dT�i��H�lX(��a�2��B 0v��pU4"���<k�`"gMg�y�J))��%d��wy8�����轏Z�9g�I�H��B>��.MȚ  