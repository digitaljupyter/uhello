import std.stdio;
import std.getopt;
import std.string;

int main(string[] args) {
  string greeting = "Hello, world!";
  bool traditional = false;
  GetoptResult gops;

  try {
    gops = getopt(args,
      std.getopt.config.bundling,     
      "g|greeting", "use GREETING as the greeting message", &greeting,
      "t|traditional", "use the traditional message", &traditional
    );
  }
  catch (GetOptException e) {
    writefln("hello: error: %s", toLower(e.msg));
    return 1;
  }

  if (gops.helpWanted) {
    defaultGetoptPrinter("Print a friendly, customisable greeting :)",
      gops.options);
    return 0;
  }

  if (traditional) greeting = "hello, world";

  writefln("%s", greeting);

  return 0;
}
