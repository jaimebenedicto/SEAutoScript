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
���8[1.sh ��TU]�|�$���S��*]"�twJJ�������HI�" -R���� �s�����}k�����;{�=3{v�	מ���r���"�5	/ǹ��� �����CP唜D�m��>��p9$���Ax�g(>��(
��%q��C�P����+�"6<C{�����z�p�;p�;p�w,�\�����Q��Ne�r2���Ku��,�BDg�)\������
��_'~r�Z�qښ��Zٻy�{	��q�8p��l���N^Y��x\��M�K��=��.4��`���_���t��A`ݕ�� � F�!g,��c(J̇�)¿�)�'�5�m�����ً��'��.��]�^�+^�w_��]��_�{^�;_�?� �{.~ns.{�u�r�s�	����B J�g�o��G����Qp�10��s�7pq5rv50� ���Gg+{Ws@����DX��������jeg�0su�2���:��9BL�lmL@���bgf�b�
�9;�; 5F�V0������jf��=!vǪ�=tq5� ff&�s�F����u���0:	�����l�����,y �+D^񦔴�����>F~���N�",&��yb++�� s#�� �O���I���T��]��G9`�q
'=���h����
G:���O�ԧ����S��8�u
G;����OߍN��p�)��z
�:��9�c��O�8�p�S8�)���w
�8�㟎��K��S���s
'8�'��	O��p�����>��<�L扰A�z��:>5�^�ţ� J o	�,L�-���B��yp�-4�x���B1��ypI,��x���B��yp	,<��d ����/�<8��0���^P�� N����xpj�`�o��t���yp*�a�4ȃS� ��# N���!���<>��0��/���@�2��0�
�	`�x�囡����ih�̚���OB	�S#>�|�#����11��@�Qq�!РWģؔĜ�������#�)��P� �*���-J�\�>4`*<�Bg�G%Nn4�	 tD�Q�X�1�"<�<݂���tۚ���9���D,hl��r%|C�WL�M�5�Ԃ"-�ᕣ\h
?�00�񘡆��r�+@	�CD�`�BP�`�� 	lp�hkMCC}�C�f����Pٝ�Z��>�l4��h'Dv@� Qv;���T�ThS�ն�Lh4�$��W�T���Ȉ!(!��a�(���8�I�I�_ou������JK�� rl��� u`M@�dw�(�g7� �^�0P��|}��_�p��0�S����Ix�����%O�P"yq�J�W�k"�8u<X@��n�|h��B���q�n��!�%�Z;�lhx�D>744t �i>��A�����[� �Ud���b�rl�b>�0}�b����c30i��D�� ��A�BLh����t����
���C@
������upt[��e궶���q���������۷Eb� lb|X1��"�?�n�h Bghm�2���.�� &�5���5A�e�ޣo$0,2���\�y;?���1�i�P`1�=$Be'O�!n��8��p�5�9�A�	��9�:�״�Yӝ{�؃	, ?�D0���`���`�I+@n����X��2�D7`6A` �������EҚ�S�&�׋-8�A���'����̍����XD�-!��p$uO6`	��`�����ad^�:p�k�B�_�,�T}�"�:�X��V��F [	��ʁ���p���#�\�.8��>����E�Wފ�yA�Ԡ=�NX�j^Y��R� ��[��u��-�~�e�Ϝe7�NXh�����( {,"8�I�J�[h#\��xp�d���[R=�h��C���O�e0��u���'l�LB�0�'��^���u�q��7@����J�+7��Xۇ�r�'*`%"l.�֋�?�C����p̜e7vO�/ ��V�l��H����Fp�!�����6�#�@GZ�v�%���P>��Q�����( \:W:��u��׃x=��=��_���AQ`;�Ǟv+3h	�[?Ɏ�h��(��'����$�,��@��E ܕ�R�dt]I�
��U�de��2`(s��Vx+�����uO|Q�e��M:*;��|F�&}��i�;��!��!Q�����a��F�-��&oXL`	x��w��&���C}�}�6	����d�, �+�8H�:X��h�^1�zU��U�[@���Ǖ`~V�_n�6�"J5=(��D�����`���ṵ2��0���B�n�a��x��A�`O�u%��N=­�OW���Bm�CM���c!QC#�A�󊡮tk���t��D�x\Rd��=��m<@�:8ϻ���J��|^W�Sݒ	]�<"�4π��?��zt�����+��ґ(%j�pW:&�po:.�M����������{G����M ;"��9r%�?���+с��p$����	��Yv^R���=���Ao���u��7�z�u{7[[qD�B����w���!�#�����R ��w�m��th������5	��� � �(����� m�%� �J�j	�?��/�'�N�!���h��F
��QB�M]P@?Q�6 q\w��<u�~�o�����{���o�7���:S�����c	���L����j�c��p��v �8L�@��o�>�Srڀ\9�9l�N ��� g�!G !�����1c{z�A}E ��>��(���hшQH�S�\t��+ ����w�#�u9������;|��wܓw�y�c~����~�>|�mE����{5����2��|;8��BtΟ�o#k��1'c3yn��|�8�|��*q7��'�<�p�q�}`)����?��'��P$ �^'���_��yi��8���-8E����8e�S8����pj��p�O�4N��N�t������M�U��8��n�k۴�,gܷ7,ZY�򠗼��f��V�/Ͼa��/����,�?5�,햲T(3�ڥ�7[*.��!��5�\q���1��?�ٽ�`�pM�t�{�ΆS�a���?���V*j��=ہ"ht�)�#��m^�#p{/�G,�wnĤǺ K���c�U�C;\�W����'�6(x�*h��r�|8��@�u%�%�G���!�$���99����p�㧅<U��7���w[4i��Q��өz�aJ��2�L%^�˙lt1��ɢ�"�n��4atQNl3��x ���0ZBU�Տ��W�|��E�+w�j} 6o��{�������D�:��Ǘgm��YQ;D��Z���ھ;�-��_(C"A�5�����7�6��}�lM*�F���=��lA��O�;���F�.�z�i&����U�^4�-n��
%%�v2G#���5���>F8h�<U-�O�&t~���Gj"�"~P{G�m6Z���p�Z_�iR����H�Y��?����?N��?l��A|��#�l��Y��H��~>�c�'ֆ�V,�uZ���]\LeeRɭyf(�I�&��͹�z����pL���h8�p+����p�w�:TQ{S���H��ow��g=k~]�K1��X��kA�?!�%XD�4�F�9
}[V/��TnvF��fz+�w�v�v\��"�����)1�E4�>�b"�URFRs��j6�r�F���2��zP�(��-�����l�>�)^ɫu�t�YCL��>���a���#4�)X���g������qO�-Y%#.�2c������8��$�_���c̗m�ͥSѷb�֐�<R�:j�\���֟�l�<-y���|������qº�J�p?��ނہ�l8�ޏ�Y�M��Gr�B��X+E�F�wxb�7jk��Ȥ�!�L�fl^�b%1:~�( ���^��L�zNH�y����+��I�j+�=��׷�#��a{kɹ�������.�4������6v��5+���!�JI� ���pyC�p�&Vb�z^���
mt��,���L���J�ڸ11i�����/*�5�ۖ�"��n���	��qmf�k��]��5�E]w���"�ׂ����o>
�˲�u6���F�)i���\7���p�C��՞bs[���֧G�_����ĨC~�Ne�5R|��@fע�/e��'�P��
3c�&�ЯA�nG��`���7]�P�P@J��e����c��nL��Ɔ�&tx�9E������Cq�l+L<�!�)Q�@󸄴�U�t�Eٙ���m�!<�R�a�i�8���K�a�>�+j��6{�/�q&������ͳ�>L�8��[����(�GG��,�-�+���*Bd�^F���ե��ʨ�������]ڤ�,sY1t͐���p^�ZF��W�Z���"�ꇬ>#+�ˢ
c�zI�=<�L��9O�mb����|��)%8D�E�Ǿ��ƞ�N�ϻ��ZW�z�%�S�X��eUD}N�:�G(!yU=O,�PC�����3�{��92ťRòH����Uk�]�o5�5�<�S0#_��x����]v���'U4�&k ���+�e���Dò��b��OQv�l����m��V��������RC揔��2$�/�o'vu8�v�:
q�^�t&�|�S�9�����C�[K�-������ʤ�������p�~�:�c�M5�|vU�u��g�{�1u��/ť�3l��#dv�&T�4EU�Г\R�2��*��^��'���(�MK��T\���WFF_���͊���/����@ޣ�h��WC�k�&D?���>��A/ȼ;Q��i
c[���DV�)r7.���s&�qh��-�M�z��Yp���ek�,��+@z�M?�T	p?b���B����(AMdy��({��h���أ�l��x��\�'_!��k�@���&qK+�@i���}��E�Z^o������L"q�N*�t�5A�X��VR3��#�v��2#K�64���}O.�V�(�A��Zü���&�s�q���������UǑ}����Pe��f��q�O�q�ݺEE�k~��&J����֙9��i�%����&��Ja������88��j~$(���͖Fɮ��;���Չ~��<��⑜�T����h<B�v�f�tϔdI��*��>��qFfh���d���W&���+�M=dϑ(�z�'��w�2Ƈ�@^`g��Z9�!�胷��R�>:5��,\5C.|�B�_*��Ԣ��	$��Tv|�����ޛ�%O֠���(���B�5t�Ue�����{���/6bp�䗏��dVp�{�1j�Op�z���@�"��K�~��o�"R&�	<d=��������5�/[��K ��؍�$��0|�"��y؍i0����r���hZٷGD�����:��f�ri�~�_q���YxT(�|���8%����uYFW^�\�:�}�[�w�/wh��oY��b�p��)�����������A�]��	B�g��,n[�G�O6�����8S$�4�!x��R�6m�gz�k��[j�^�A��թ��=0l�e�E�o��J�Hx�b1ũ���J�̽�m���5���w�ϻ�z�!�?�Tk_��ުJ�u�7�GվD[�]�hb��b�R�l�\�5x0������ճ�^S�G�h�~w�����k��L֮���Λ	r~�G��>4�!c��pYg�����IL��L��j�~�$&�LSء�Y_X�������$l������Au��&������ަ�f?2V���M�i/������8�y�ae�� ��=�>d��7�;UsW*��Y_Z��0RXqp<������=Ȕ������-�~G��j�j�е�V|gf��q�G��I�O�HBփ�Q!���5�(T���y��%Y7�Y����O	*?Y���E6;"�b>ȇ�K,ɶYo�Xf��JY
�/ev�����}'X��4�N��+��7؝�%������>V�z����(����A2�q����H�h�������>����4��2�ߓq����T�X&x�?���h��0'�u�� �V�(��8&��k�Y��9J���gd�%�c�p6kx>A����u�Ij���Dܕ+Nd'�0�<+����?�3G�ߵј��7�]�Eek�a�_DךQ6Ph��#�����<w�L�a},� ��\�P�E�"1�ڛ���K)��ӆʹOq�ڛ�|�-�=�%N+͆�%�+�RBJ9�P�gRd Ku��3��^[õ���-�Ϳ=F޻�(�d		Ty����ڋS$��QMfy�a�>����}^����A�YP�Să{���ըhݥ��fR`�5u�d2ޡ3Qϯ��lC2���uy=�����8��4�;1�I�{RI�����ǟ�o����P�`�"Ԭ�3ZmȜ�'���ݶ;�sň&��th6��WeU4�L��&7�}B0F����~������G��,���}��凌�wOt����kr�����Z�R��νǿ����D[�I�]����s�$eBk���)O^c=��W�m��]mk����1��:�խ����hd�=5{ӯ'?]#�˻��ڬc���;���1ۑQ)��%I���J+���u�����6۞���
���K�ҹt��D��;w�ߘ|6	�ۉ+���JH�2ⲿ�}�QřP���.8YG�, ���̻��gy�>���5&�`�Z�U�f��z�k?�-F?��������@����~��/zYa�7��n�p2��C�����8���j<�[p���.���������e�����Ȓ�4�r2���=�Y��L�$
�rc��~�Ē������n�w#l��c-�����=�1o�e|dH�x�����J@PƯ.�.��[�h��5[����JYu��l�\ր�y��P�&>�����{ܺ[:Z�K$����k�KE���_v�8� =�C��F1�\ٓ�%��SI�Q�@����*���F�RZD���?ߜ�%�;��Cû�^Djf���ݗ��rc�)p��|��������<��ۈXw|�$�t��0���~!���6V��T�����U��B����0f�m�"w���J���4�|���$�1zT�`��l��������S�Dٞb^m���׿%�L���P0K�5�}��U�6D���������"�MC�_f�ɽG	��C��u,啶uGu���י�n͟}J#8׾��r�wؚ���I�!k���z��ֱ1=�P9z����/�A;��k���be���X%���1}�ܷvF��%X�ERKt��Ei��S��h�/R����l�����<S�4�M9�d�[��r���in%"2�j_�d�b�5;Jq� ��jU�U��$L�Є�i�3��u�l���l�zy���Ͱ�u���8��O9�`�{�jzZR�-��	4<���9x�'D�Z��9>�/Y'[�����IxV�?��5/���VP7J`R��雝�f�z[�5��P�nk�1�Nɘ�zH�-d�U8�R�X�͉�P�ͨ�'�"�����dj�U�E�W�aT�,�I0uh�?'��4��:����R�A@�l0�eo��K�o8�X��1��j,�˷*���M�g��㖜[�V�RI�h׾ON�K��;t]�k�A��ft�5=},d���r6}���ߝ���M������wf��(�Q�W���}�o7�}y��-AC�h�F��_�ֆ>��4m
��yW?�^��!��o�\m	O�Dǝ��ԌkI7?_��.��
n�;YF+��f[n8P�����n��ߎ������:	���ݾs�#�c�Y{�
����-�'��~Sm���E����z�s%�x^�w�4g���6^�y\.�G�7��5S�~�ۤW�܏�	߻i�WЖ��g��;
�m�m���c�w��gc����z$�O<F����\��.aE�Cd#�2����ro`��U�~�k$_�:Z�r]l�.>��a!g�������Ɲ�r�H�D)��:�5�
%��E2�W�z�F$��K�����{��YZ�oیƾŏ���e��Y|+^�OE��w�&����r���x�)��8�2,�Ɛ`~;\y��h[&ǭ���Iz$6�ZZ�&�d�3�+��Φ�x	����qs�4�neʗ�5�(�:�H͍�t-3��m��vE��;��+�e��,���������S�/g��t����-����YԿ���q�,J᬴����X[��i{d���#�>Ts�h�Iڝ����8���˟���.�Fd�s�'���m� cS�0�!����@�� ��c������e�s2f���n�Vt:xg�ke.��|O�j������(��� ���j��_kf��|+����)=k�c���s��}ݤC��}%�k��T�cE�H��YNx?�?��T�W)ü��N��'�Tq�h��������q\�L�Gj�9X����v8�MR�Fi��Wm7�ßl�D��h��<��Z����+%����A\#���	���&���KX���b��?��W��ى�qx��oi��_ng|��\L��H�}{�g˰v�
�0�}�+.���~������|��ϙSsM�սӼo)ZQ�G�S�[�J�36��z�?M�K����!j�C�Pq���ż��;�A��/�Ǌ�J[Ʈ��ݿ	 ��y��[�/?��:P���c�X����Jl�&�����?u�)��b�*��"�vU��gM�Ә-l�����P��H9�q�����n2��C���˯@~h6߫3�GE��MWi�)L�Ҙ�*k�yb^�܇��l��j��i��ѵ��%�?]F��*���b%��/�[����3����|�,�Ҩ�R�_��)��@_����1|׷�0�'��T��0�������z�����OC��*�~����o�)��a�Y����� =�u�Ɂ�d	_tM��8��xNH%с����N9���@�%ə��_��wZP�w��;~r��T�N�O��+c�V3,�VѾ{�<Y�.�A��2�זr%��m�٦{~}d����~]aLr*m
nز��fD느܋xN�;t�#�lz?�y)�]Ų�oy,���Z8��.^-W���CV�Q��L��<&�1�)2��2�}4��#ƺm�EKFf����-���|,��bJj!�M.����*��&b�5�[TS���3�]٬j���6J�+��)��5�w�R����u�h���޻��u�i��92����Mh���|����+w������}�9�W�:<i�	%��g�*��" 9]u7�A������CH�g��{d.�'��|���d��x�A���ʸ�a��=RI{�-����v����lؤ�I@EN?�$:ߔ#"3E1�j���1h�by�Mf��c����b�`�-3�;R�`V�=w���Do��ۭ81���W��ꣻk�ɯ1�?��yّ�w��
��BsFvs���T�ަ�P=�5A��ƤANncI��h<Ԍ���6��'W��?�kx@��F�0N4������'�υȒy��u��Cy��������T��>��cF��7�Y䤲G�\���ύ7�z�N<Ds���J��bK��?}�M��S��/`�䕔q�����1�䛜lə�ӌ5E	����۸8��1�Z�0�%�����:}�.� �uf%/�����R��{�?.�o�i�t�v��Y��3�O�ҖV��/���v���Y}CB��і�^���g䕧�xߕs�Ǹ�->O����z��TH@��}��}�e�x���w?C��BnZ<$�.�m1E����������Æg��+y��|zj<�� ދ�?�p�|T/�����ɔ�'�v���VR.��e �k"�,���È�Ѝ����Q{������W��o��S�-����9�b%v�<<�jU1�%��"���X���O�u��o[�]�w�j)�^�.Ӎ�Y�|o)S���t��:��͘���>A�� ��BA^JC"�Kmz�ݹ���Oߟ�ɳC[�"�K<�����=��u���e�:#��5��0Ӈ��W���?��}�E��S��۾�L��W^��n��/)����#���EC_�:�N��)#�ݺ��|���J���C���?���4�L�G:�8}��t=�q�d�rzuV�W�BDd^m�!��&N�λ%fJ�i�����������{?[E�$b�;�I���EnQ�ֆ|�N��5�;]E-�[�t)��lzk@_�He�X���;1~�||�lGy����� ����|sv��Gv����-��g��M%��rCSg�mDl9?�����J�Lw�8���/k@ET@t)�<��V=WÑ���ԡ�V"s�K��1�}�!.ڜ���%�>~��x����\���B��B��-e/#ѳC��� a��Bv^Q��>�G�"�+�Fn�ޱ��^���*��X�f���9箊�/]�pP�EK$�OD�W�o�n�E.��{L���)㠪���(�#�Ɇߙ�ՓB�[,ٚ m�h]��0�0J��=���D
�������V}nM����鉳��xs�Ԉ�����Z��ω�Jښ�g=�Fꈑ.���G�X�^Մ�O>�����S?��>�}��w�1�X���D���N�@E�SQC=�uτ��'�ۏ�����|��d�2���6<fx3����8A���ŝ�����$�Y"�y.���=U-�U��ζ����	�i�DY�L��2�u��	����l�^׋�6�����7����
M&��8����p��[	)��,��M�}�Qуg$Կ�S�\����8@���E����JS�o�sؖ��:�8�U�k���t��~�i����z$��6m�U�����:1�[I��|yZb�xgo%v�^���k�������WM��>����]K�It	�t�\�o+�3�瘰�Շ��/~���Hy�P�f��YbCa�*.G�D��a�%���ۑ|�'����jSx��Ԉ�Rɂ��x��8L�����D����+�_Q��("vx˧ë�FM�כ�ko�hh����O9C�R����D�l�2lI��/y��#%�'���G�7�t��C�Q|�����4~y/��Z�V��t�yy[CU�`�GQ}�5���
��-=v���va$����i)�Yt�L$&a��Go	~%��,r���3~��֒B�^�RT�����%�IG�ݪ�V�XGcI�}����.ѽҥ5�7+QT	*^��s*�=J��.��v�n�M�k�2A��x=�M;Ge��y�w�[~=X��a>b@�W��_��^��bN��#����hf�����5�
};�(�}�"V��<�����0ȍ�z�ڲ�"eaQw���[p�����[l�#n���ܦ��V�c��͗$���������y�!:�w��8q��
����Fï~��!QM�
����4�>�)��5�����$�Q�X�LXaO��4D1$�&��M��m������%	�8-�eJ�孨7
���ӫ�<��7^��܈wO�I�G�ay�-���Ϗc`My���i�����ш��	��};� ���H����q1M�>����'�EM&�3�q���T�B{��b��O)�����@�� �?��-9�^'Y�����<�^�p�<ʚ[G%^��o�&s���k~<T��U�����pI�V�t�wh�(��$|D�$V�m���]ڵ�B�)Z3�BM�~Oû�������ۏo�Y+S_z�Z*�����C�Ѝ_�_�$nKf�XF�_7��D���[�մS�l��և��
^n��Y�L�hV5#!|$+.iq����3ԅ��S��w�Ȑr\�k�{1��M'��v�@G���3t�[�#sc�Ř��uC�wI��+T�n��|7�Rд�l+	�,[�Qɔ����n�9BA#�?aP=�o���
K���q ��ݐ���y�U�!��m�
H}>Ot��̡a�t�}�G��	�ѝ�l;�s�Ru�����K%�EI���`�D[��$Ewy�\l�&c�����|�l��\Ы���;{�ʟ$�7~1M�-����&��عf��Ȏv�'�Q ��Re�.�����)�z����G�<��(���~�Z}�d��2�T%:��EggzR_��p�W$r���]��;�?bX��~�E��A��a�0�5��*�/H�}�"��i��6��VG�Y���|M�ׅfW���QذE��>�)�N�[��~v/�'�|�!���[�lʑ��D���[��B�WP8�/�%.0g�C6��^�Uan[�}#�4��^O<�
�QF�dt�}�����:���Xv5�$���V��!�����Y�p��Sh�Q�q�����R�"{�/�+�����1f������H��)���_>�5ǰ��z��_޶8h�ۃg�l�~�@����-8�\������m/?�c[x�:붳'�y��Ք�[)�è��x��T9j��L#ي���)UI���z9�8��'��ɠN4�&�y;Wgd�6M��d	��Y(O��"�G~�M��ƶ=��3�q�����t��Qן�#�"*�t�+u��H��jձla(�����k�NN�弮��H�N�:ٝ^'��:,H���df�zU��41A�F����S��F�s؃��ˮN���%J�jt��7��z|U�6I�=���X��B�Iևv���I��$���H��;$���&QO=��(�MpP�����b��S�v_?�?�ĥ���4fg�k��x"(I�]������[ݿ���H���=xs��3�w.�^�{ۀ�h�f��Q΢@����a59�2f�k�u��R��ҩ�Wb��2xᙪ���w{��8w���4ݮ)WWw� W�愡�ዌx)�Em�����������_Nll
%�kL>}v�hE9������_#�
I��Ara������c�ŗ�ՙJ��m'֣T��s�z����^߂��xg�?OZ⫳�5�I?0c��N#A�g����-B)^!���dP�N�Ž���+gCJ����侄P��9»>���\<M�&S���5�(�r�&�wR�z��O����(���(���p�rgyI򳴓%;�$f����'����=��=��+���卻+��	�?Eė4��:>�qo\_�Eݯ��(ZC��jGN�$��>�Z�8}u�FI�"w�"c�%۲;�r�Y� ep���s�T ��[d�K����Y�$�5�${���@'��	�KaT,���6v|.�u~�m�>�T�R_�x�@)�4����\SʔQ|�#+�=rB�6}O�2�CA�I�$:�
2��	������՛����U�Z5`d����Z�Vмe�.U�#Pl�4y[��B2��VM?>�����N��\����S�f�ym��Gz�T����|�L��h����;��ꝛ��ju��tItn��:p�4COz��)�����P?��곆���xj�����>DwE�nGOC��a�J%´�������r��,i^\O�����m��|�^�i1G� D�
�e���䧮zd��<ǰB�*����оR��W�Ij>�6n��q����37�_q�����;��];V?�M���#?�2լS���5؆V����?�|��q*�M����K��d�4�޼� y���8�0��$&��!W圍��5M]�u���TXs�����ڑ�o?7=IzJ﹵��廕��#E*F�L�1��=.���%+?�ptY��/�+:"G:�ْ�2�+�Q7>�s��Qa��I�9�ߩ��������~`�F~H��^@��n�o#��]&���W��		?�gӸ�,����Md&��SU��k/�ÖQ	{V4E���v�L�>�oD�DS��D��g�w+n*��zx(���j/"�L"�JL9�M�B���$G��AaB����C)g|?��T;'/��(w�w���H�_~4K�(�"_92!�i�.�4¹�S^�e�R��?��<�%[�~�)e�U
���$-:�t���_F�un��ԗ�e[�{��2ب	���?���q��s�vI���}���u7L��_�;᫼1�S��|_�V��G�Y3AVcp��;w�t���m�}��C��]�����p$_�ͬ�͏N�k�B5�������M�i����(�����W*��*�319���N���*°V��E�j�C+�W���y��#?�(���&A[4�;x6d%>�H�m�Grk�z�����V�F�n�0ۺ}��`�u�l����L4�Z�g�뷺xE�z��y~����\/Tܜ�b�^_�Y������O\�ܭ�d��WZ��jL���6�q��!�eh
"ui�L�ĥ
GcFu�"��O����{y�2/ٯ���P��۔��b����Dݷ��4���FCOn�a���LrnLH�Eӂݚ`N��K߭=C�Il�����%�?ԮO��ɏ)s�J-�ʦ5�ɤ����x�囹񺙚�{��+]�|�ھ��TI�q�릸AE�.�x����ZX�fL���)À�I��B�f4�v������d�m��Ɖ*n�㏀o� ��Q.�Н�K�
K����`t�(��3u���`��c������x���P1)t�a�=^�\��{�e���Pd
1f^��\^�ڣ����j�#��W6�>/���*�?�g~�m�t�>zZlj�d��+i����Sa���E�3&��y�&a�26T^�+W6s>��>}�ޢ�~�z8���ϥ�ۢ%n�M;31�ZR���W��fn�?���A� �E�{�-8�]�Chn�OJ�p������tTzox����P�/����8��S"m¹R���o��ʩ	׮OiWl,|�v��nJ�B�Q��wI��+Qa��F��S�G|k�ƙS]�2��-H�<�"�o!ou|����HTd�C�7i�,K����������[s��ۚ�]Y�����*^�mHe3�����OE泀d�:�>
��W�����汨r�}ˏ�a�x�}e"�ra�ST��c�ڀ��6ul�(T˂q]_�o-�f���m�'����w��TW�c,��I�z�z��Z�6ߴ3�س��4|P����]B�f�������F5}�
:�w�c����(Y���U��1y��E�"�eP�vXq��s�5BK��i��iw~�A��J�Ʒ�q�)ܓ�yVp�_<� ��e���7�&��Э�bEХM��O]o�)�B�>��F9a�)��ӗ ��<	U�Q�cJz~!��L�"Z�d��WSԙ#
�%X��I�^u�N��-����]bEfL�V�tw7�R�?FG���瑅$��ZB�-�9�t���=�PJ6E��:���_��Bo5����G����Xa���g�WY�^v�x�xE��=��������i���Y+�b���NMJ�w\�J2>�p�2�(�܋�p��ĒÌN�D�n�Q$�`<j�R�6�a�͙��f:�N���9�F���+OUַ~�)m��.��5M�
M�{���1�D��Q!�G��d� o��ƭ�W_�#��Q�r�!W<Ro�_�dhǚ/�s}�o�+��nu�AۋWR$�&�n���z�����~=��zm�Ŏ}I�����J��U/n�B�?�F4���P���\����Ի�8sTJ��osܿ0�E�becV�FkxeE�}}��jN���d��У!?�7E�2�\�����-?�8���đC���&��#��*��.rD��%z&��1$��[��C3��qZ�O���o�'$�D�������<���"�m�j��K}�7G��b�-�gz���5yUKZ�]�_[d1���)���M�QB[��jپ�����d��2��q�׿׊���$���b���\:����n��3��/�m���?���{$�H�F�\_��v�����������"/&�H]�69�M���-:�T�پ)%L�����G�+��G���R���P�<�{����h�k����P�ُN?��4�x������FxӼ��{"�x���+*�m�5�����H�a�C�]U�r4S�3�BHe7Phz��Z�U���Tz�}ۑ��{�<�(�����L����k��D�:q�X��GS���+y��{�X]6n��s���r��6
PQ
 ȵ/�5v�w��:0�Y0�Lxڻ��������1���5���˥�"�~��ރc�������x!HJ�	�j��,{����/7i�X[?3~��J*~6v3�֤�u�m�7�lQ�B��z��yހ�c䥥E��䕵���8�8�y��y�x�y����L��F��8;�3���i�jdPW�cjyR��w5sv�p�;��qHJ�dw5��s�n�nV���V�gi�b	�0���SW��w3g0I�i� �s6�5�%G[W�I+�����5�������afi`�ldgf`i���0qupv<&�&ΰƍ�L�\a?Ƕ��� b&vvf���ߜ�"���{6�o޷���Ο�;���Ϣ����W�tֶ.�s<�9��p��������|m[GG'�'��� G9�g��R���C<w�/8�)*������݆��C<w>��y���O~�D�������x�������'����� ����� >������=Ox~�N�xN��|b���(�3����N�;}3���E�zN?���WE�o��s�	��O�,��P�`��?5�����y�N�����s�o���� O�ɕwN����g�^�~�9�t�~:\?�n��r���<��=^���G\_����uN_��J�����/�C���'y6�$�9��Fϵ�_m��n��N��?9�ׯ�_���o���j�'k��=�>��m!��Q��aC���7��s������/�'�ҹ<q';\���������b-x����������ч��F�����.$PQ�?pĿ�ɳ8����Y��}�,���~uG�{:�����n$`TN�gq�����8��8��������Y�o�=�����gq����,��7��/��gg����Y��o�9���+gq��<����7�ŉ���8��}{�'_�Y��?�"�I�y���`1�׿�!P�t�=,0��� ��=��v%ε��'����?�7�p��\�O�������p�����/A����I�����vϭ���m��!�L���*�?yd�~Q�����'���q��4��q8N{�+�{���~/C��������[0��Cn����p>n'1X����z���	��?� O�����f��x�v�����p|��q �p��8���{������ķ�ێ��x���F'y>��=D��ϣ�����v��s�_�I���#�A ��m-'�@ϭ�v�}|xC��7�;���7����}��tA^g�c��X��������.������68�@�8�M������䉽���x����'8����p����S���y��/���s�;p?������`�<'���O�|��8������s�@�5U�ojh ����)���������� �M����b�`�hk�jf�!�+�+�L=@N r�Y������Ye�-9uI%ٿ��I��VL�����b��x�R���j��7��X�?6���������������������,h�ld`��l�i`foz8eI���0�p�8�����<���&.n��OpQx��g�k�r7P7��rq5s��5rq1s9�a�}Ax&�sam'��O��Ɍ}��8i�yX�l���4��Dn� B�V�n.f�g;#gx���N�<�Y	xN񳠉��q���������``idojkv�$O���I�}�p��'?k�8���F�_���'l9p�+u��N����w����s#g>x��s��)Z5�o�j	L*�AX��s���z��|l��א�9��"�y�a�� u!�*�b  