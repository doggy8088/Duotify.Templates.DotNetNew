using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;
using Antlr4.Runtime.Tree.Pattern;

namespace AntlrGrammarName
{
    class Program
    {
        static void Main(string path = @"examples", string searchPattern = "*.*", string[] args = null)
        {
            System.Console.WriteLine(searchPattern);
            List<string> files = GetFiles(path, searchPattern);

            // int counter = 0;
            foreach (var item in files)
            {
                var txt = RemoveInvalidCode(RemoveComments(File.ReadAllText(item)));
                // Console.WriteLine(txt);return;

                var stream = new AntlrInputStream(txt);
                var lexer = new AntlrGrammarNameLexer(stream);
                var tokens = new CommonTokenStream(lexer);
                var parser = new AntlrGrammarNameParser(tokens) { BuildParseTree = true };

                var backupColor = Console.ForegroundColor;
                Console.ForegroundColor = ConsoleColor.Yellow;
                Console.WriteLine("// " + item);
                Console.ForegroundColor = backupColor;

                Stopwatch sw = new Stopwatch();
                sw.Start();
                var compileUnit = parser.start_rule();
                if (compileUnit.exception != null)
                {
                    // File.AppendAllText("G:\\Antlr_ERRORS.log", item + "\r\n");
                }
                sw.Stop();

                backupColor = Console.ForegroundColor;
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine($"花費時間: {sw.ElapsedMilliseconds}ms");
                Console.ForegroundColor = backupColor;
            }
        }

        private static string RemoveInvalidCode(string v)
        {
            // v = v.Replace("\"~~\"", "'~~'");
            return v;
        }

        private static List<string> GetFiles(string path, string searchPattern)
        {
            var files = Directory.EnumerateFiles(path, searchPattern, SearchOption.AllDirectories)
                .ToList();

            files.Sort();
            return files;
        }

        private static string RemoveComments(string v)
        {
            // v = Regex.Replace(v, @"^\s*//.*$", "", RegexOptions.Multiline);
            return v;
        }
    }
}
