SOUND soundA;
SOUND soundB;

#define SOUND_FREQ 11025

void setupSounds();
void playSoundA(const signed char *sound, int length, int loops);
void playSoundB(const signed char *sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSoundA();
void pauseSoundB();
void unpauseSoundA();
void unpauseSoundB();
void stopSound();
void stopSoundA();
void stopSoundB();
