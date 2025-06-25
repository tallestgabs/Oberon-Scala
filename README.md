### Gabriel de Castro Dias - 211055432
### João Victor Pereira Vieira - 211036114

## CONTRIBUIÇÕES: Pretty Print

Adicionamos sistemas de tipos

Adicionamos Cabeçalhos

Adicionamos Sistemas de Blocos

Adicionamos Funções que geram Expressões

Adicionamos Arquivos Jimple gerados no Soot

Organizamos os Testes
```
Obs: Implementamos o Pretty Print no JimpleCodeGenerator.scala
O print foi feito através do código Jimple gerado, usamos Oberon apenas para gerar arquivos java
Não mudamos as Declarações já Existentes
```
Um exemplo do que fizemos:
```
Print gerado anteriormente:
ClassDeclaration(List(PublicModifer),TObject(SimpleModule4),TObject(java.lang.Object),
List(),List(Field(List(PublicModifer, StaticModifier, FinalModifier),TInteger,x),
Field(List(PublicModifer, StaticModifier, FinalModifier),TInteger,y),
Field(List(PublicModifer, StaticModifier, FinalModifier),TInteger,z),
Field(List(PublicModifer, StaticModifier),TInteger,abc),
Field(List(PublicModifer, StaticModifier),TBoolean,def)),
List(Method(List(PublicModifer, StaticModifier),TVoid,main,List(TArray(TString)),List(),
DefaultMethodBody(List(LocalVariableDeclaration(TArray(TString),args)),
List(AssignStmt(StaticField(FieldSignature(SimpleModule4,TInteger,x)),
ImmediateExpression(ImmediateValue(IntValue(5)))),
AssignStmt(StaticField(FieldSignature(SimpleModule4,TInteger,y)),
ImmediateExpression(ImmediateValue(IntValue(10)))),
AssignStmt(StaticField(FieldSignature(SimpleModule4,TInteger,z)),
PlusExpression(ImmediateValue(IntValue(5)),ImmediateValue(IntValue(10))))),List()))))
```
```
Print atual:
Public Class SimpleModule4 extends java.lang.Object
{
Public static final int x;
Public static final int y;
Public static final int z;
Public int abc;
Public boolean def;

public void <init>()
{
    SimpleModule4 r0;

    r0 := @this: SimpleModule4;

    specialinvoke r0.<java.lang.Object: void <init>()>();

    return;    
}

public static void <clinit>()
{
    <SimpleModule4: int z> = 15;

    <SimpleModule4: int y> = 10;

    <SimpleModule4: int x> = 5;

    return;
}
}
```


## Oberon Language

This is an implementation of the Oberon language in Scala.

### Compiling and Testing

   * Compiling
   
```shell
$ sbt compile

[...]

[info] Loading global plugins from /Users/rbonifacio/.sbt/1.0/plugins
[info] Loading settings for project oberon-scala-build from assembly.sbt,sbt-antlr4.sbt,plugins.sbt ...
[info] Loading project definition from /Users/rbonifacio/Documents/workspace-scala/Oberon-Scala/project
[info] Loading settings for project oberon-scala from build.sbt ...
[info] Set current project to oberon-lang (in build file:/Users/rbonifacio/Documents/workspace-scala/Oberon-Scala/)
[info] Executing in batch mode. For better performance use sbt's shell
[success] Total time: 1 s, completed 25/08/2021 14:34:33
```

   * Executing the test cases

```shell
$ sbt test

[...]

[info] Run completed in 2 seconds, 286 milliseconds.
[info] Total number of tests run: 246
[info] Suites: completed 14, aborted 0
[info] Tests: succeeded 246, failed 0, canceled 0, ignored 62, pending 0
[info] All tests passed.
[success] Total time: 4 s, completed 25/08/2021 14:36:21

```

You can also try a combination of the above commands, for instance `sbt compile test`. It is also possible to run `sbt` in a "shell" mode (this might save compilation and building time). To start the sbt shell model, just type `sbt` in a terminal.

```shell
$ sbt
[info] Loading global plugins from /Users/rbonifacio/.sbt/1.0/plugins
[info] Loading settings for project oberon-scala-build from assembly.sbt,sbt-antlr4.sbt,plugins.sbt ...
[info] Loading project definition from /Users/rbonifacio/Documents/workspace-scala/Oberon-Scala/project
[info] Loading settings for project oberon-scala from build.sbt ...
[info] Set current project to oberon-lang (in build file:/Users/rbonifacio/Documents/workspace-scala/Oberon-Scala/)
[info] sbt server started at local:///Users/rbonifacio/.sbt/1.0/server/5b1186f4048efb7df7ec/sock

sbt:oberon-lang> 
```

You can now execute `sbt` commands directly. See some examples bellow. 


```shell
sbt:oberon-lang> compile

[success] Total time: 1 s, completed 25/08/2021 14:44:10

sbt:oberon-lang> test

[...]

[info] Run completed in 1 second, 604 milliseconds.
[info] Total number of tests run: 246
[info] Suites: completed 14, aborted 0
[info] Tests: succeeded 246, failed 0, canceled 0, ignored 62, pending 0
[info] All tests passed.
[success] Total time: 3 s, completed 25/08/2021 14:44:41

sbt:oberon-lang>
```

### Building an executable JAR file

In order to generate an executable JAR file, you can run the `sbt assembly` command.

```shell
$ sbt assembly

[...]
[info] Run completed in 1 second, 781 milliseconds.
[info] Total number of tests run: 246
[info] Suites: completed 14, aborted 0
[info] Tests: succeeded 246, failed 0, canceled 0, ignored 62, pending 0
[info] All tests passed.

[info] Assembly up to date: .../target/scala-2.13/oberon-lang-assembly-0.1.1.jar
[success] Total time: 5 s, completed 25/08/2021 14:45:56

```

This command generates the `oberon-lang-assembly-0.1.1.jar` artifact into the `target/scala-2.13/` folder. You can execute thisartifact using the following command, which prints some usage help of our implementation. 

```shell
$ cd target/scala-2.13
$ java -jar oberon-lang-assembly-0.1.1.jar --help
```

## Oberon-LLVM

### Resources

The following tutorial was very useful in the development of the project: [My First Language Frontend with LLVM Tutorial](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/index.html)

### Missing Features

- All types besides integers

- Global Variables

- For Loops besides "FOR"

### Usage

- Compile the main.cpp program by running the compile.sh file.

- Move a .oberon file into the directory and rename it "code.oberon".

- Export the program's AST into a file named "code.json" by running the following command:

```
java -jar oberon.jar -i code.oberon -o code.json -b json
```

The oberon.jar file is obtained by compiling the Oberon-Scala project

- Run the "main" executable to generate the "code.ll" file.

- Run the genexec.sh to generate the "app" executable.
