import sys

microword_size = 26;

control_map = {
    'load_mar'      : 0,
    'load_mdr'      : 1,
    'load_ir'       : 2,
    'load_ben'      : 3,
    'load_reg'      : 4,
    'load_cc'       : 5,
    'load_pc'       : 6,
    'gate_pc'       : 7,
    'gate_mdr'      : 8,
    'gate_alu'      : 9,
    'gate_marmux'   : 10,
    'gate_shf'      : 11,
    'dr_mux'        : 14,
    'sr1_mux'       : 15,
    'addr1_mux'     : 16,
    'mar_mux'       : 19,
    'mio_en'        : 22,
    'r_w'           : 23,
    'data_size'     : 24,
    'lshf1'         : 25,
    'pc_mux'        : 12,
    'aluk'          : 20,
    'addr2_mux'     : 17,
}

class bstring(object):
    def __init__(self, default, size):
        self.dstr = [default for i in range(0, size)]

    def set(self, pos, size, value):
        s = '{0:0' + size + 'b}'
        s = s.format(value)
        print "setting: ", s, "pos: ", pos
        if size == '1':
            self.dstr[pos] = s
        else:
            for i in range(0, int(size)):
                print "i: ", i
                self.dstr[pos+i] = s[i]

    def __str__(self):
        return ''.join(self.dstr)

class Microinstruction(object):
    def __init__(self, uc_line):
        strings = uc_line.split('$')
        self.state_nr = int(strings[0])
        self.ctl_list = strings[1]

    def compile(self):
        print "compiling (" + str(self.state_nr) + "): " + self.ctl_list
        bstr = bstring('0', microword_size)
        if self.ctl_list:
            tokens = self.ctl_list.split(' ')
            tokens = map(lambda s: s.split(':'), tokens)
            for tok in tokens:
                bstr.set(control_map[tok[0]], tok[1], int(tok[2]))

        return '@' + "{0:03x}".format(self.state_nr) + ' ' + str(bstr)

if __name__ == "__main__":
    lines = open(sys.argv[1], 'r').readlines()
    lines = [line.strip('\n') for line in lines]
    microinstructions = map(lambda s: Microinstruction(s), lines)
    compiled = map(lambda ui: ui.compile(), microinstructions)
    blob = '\n'.join(compiled)
    open("microcode.bin", 'w').write(blob)
