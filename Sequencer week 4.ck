SndBuf kick => LPF lpfkick => dac;
SndBuf snare => dac;
SndBuf snare2 => LPF lpf => dac;
SndBuf ambience => dac;
SndBuf shaker =>LPF lpfshaker => dac;
SndBuf hat => dac;

.1 => lpf.Q;
.4 => lpfshaker.Q;
.3  => lpfkick.Q;

0.2 => kick.gain;
0.2 => shaker.gain;
1.2 => snare.gain;
0.5 => snare2.gain;


.7 => ambience.rate;

me.dir() + "SampleChuck/AbletonSamplesForChuck/JngKick.wav" => kick.read;
me.dir() + "SampleChuck/AbletonSamplesForChuck/JngHat.wav" => hat.read;
me.dir() + "SampleChuck/AbletonSamplesForChuck/JngSnare.wav" => snare.read;
me.dir() + "SampleChuck/AbletonSamplesForChuck/JngSnare2.wav" => snare2.read;
me.dir() + "SampleChuck/AbletonSamplesForChuck/JngAmbience.wav" => ambience.read;
me.dir() + "SampleChuck/AbletonSamplesForChuck/JngShaker.wav" => shaker.read;

kick.samples() => kick.pos;
snare.samples() => snare.pos;
snare2.samples() => snare2.pos;
shaker.samples() => shaker.pos;
hat.samples() => hat.pos;

0 => int counter;

while (true)
{
    counter%32 => int beat;
    
    
    //kick1
    if ((beat == 0)||(beat == 6)||(beat == 14)||(beat == 18)||(beat==24)||(beat==26))
    {
        0 => kick.pos;
        
        }
        
    if ((beat == 4) || (beat == 10)||(beat ==14) ||(beat==20)||(beat==24)||(beat==30) )
    {
        0=> snare2.pos; 
        
        }
    if ((beat==0)||(beat==4)||(beat==8)||(beat==12)||(beat==16)||(beat==20)||(beat==24)||(beat==28))
    {
        0=> shaker.pos;
        }
    if ((beat==3)||(beat==7)||(beat==9)||(beat==13)||(beat==17)||(beat==23)||(beat==29) )
    {
        0=> snare.pos; 
        }
    if ((beat==0)||(beat==4)||(beat==8)||(beat==12)||(beat==16)||(beat==20)||(beat==24)||(beat==28))
    {
        0=> hat.pos;
        }
 
        
        <<< "counter:",counter,"beat;",beat>>>;
    counter++;
    91.4625 ::ms=> now;
    }

120::second=>now;
