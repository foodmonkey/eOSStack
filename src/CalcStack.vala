/*
    this is the queue class for processing the operators
    and operands once the = key is pressed

    it's a FIFO queue as opposed to a FILO stack

    it's not like a normal queue because i've got to look
    ahead sometimes to see whats coming down the pipe
    constants and brackets really fuck things up in a two
    queue environment (operands and operators)

    i know there's a better way to do this but this my first
    vala program so i'm going to go with what i can make work

    i really need to get a design document together for this

    queue
        pop     - pop it off the stack
        push    - push it onto the stack
        and my extra "cheat" functions
            peek    - looks at a particular stack position offset
            poke    - changes a value at the specified position
            punch   - inserts a value into the specified stack position and increases the stack size
            pull    - pulls a value from the stack at the current peek position
                    and collapses the rest of the stack on top of it

        eval - the stack is the object that we get to perform operations on itself - so it's the object
        that gets the methods - eval will create another stack recursively until all the operands are
        exhausted and all the data is exhausted (hopefully not one before the other - that would be bad)

        and yes i know it's a queue but ffs it's a fifo stack (which is a queue) - deal with it


    ok special note - this eval method is going with common mathmatical precedence - RPN later

*/

namespace eOSStack {
    public class CalcStack {

        //  properties
        private string [] _stack;

        //  constructor
        public CalcStack () {
            _stack = {};
        }

        public void push (string _push_data) {
            _stack += _push_data;
        }

        public string pop () {
            string _pop_data = _stack [0];
            _stack.move (1,0, _stack.length - 1);
            _stack.resize (_stack.length - 1);

            return _pop_data;
        }

        public string peek (int _peek) {
            return _stack [_peek];
        }

        public void poke (int _poke, string _poke_me_hard_baby) {
            _stack [_poke] = _poke_me_hard_baby;
        }

        public void punch (int _punch, string _punch_data) {
            _stack.resize (_stack.length + 1);
            _stack.move (_punch, _punch + 1, (_stack.length - _punch));
        }

        public string pull (int _pull) {
            string _pull_data = _stack [_pull];
            _stack.move (_pull, _pull + 1, _stack.length - _pull - 1);
            _stack.resize (_stack.length - 1);

            return _pull_data;
        }
    }   //  end class
}   //  end namespace
