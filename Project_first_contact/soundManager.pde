class SoundManager {

  private SoundFile doorOpenSFX;
  private SoundFile characterAddedInTextSFX;
  private SoundFile itemObtainedSFX;
  private SoundFile objectiveCompleteSFX;

  SoundManager() {
    doorOpenSFX = new SoundFile(Project_first_contact.this, "DoorOpening.mp3");
    characterAddedInTextSFX = new SoundFile(Project_first_contact.this, "CharacterInText.mp3");
    itemObtainedSFX = new SoundFile(Project_first_contact.this, "ItemObtained.mp3");
    objectiveCompleteSFX = new SoundFile(Project_first_contact.this, "ObjectiveComplete.mp3");
  }

  void playSound(SoundFile file) {
    if (!file.isPlaying()) file.play();
  }
  void playSound(SoundFile file, boolean allowOverlap) {
    if (!file.isPlaying() || allowOverlap) file.play();
  }
}
