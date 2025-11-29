typedef struct {
  int x;
  int y;
} CoolStruct;

int cool_function(int i, char c, CoolStruct *cs) {
  return i + (int)c + cs->x + cs->y;
}