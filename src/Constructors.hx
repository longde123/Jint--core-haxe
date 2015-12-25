/*
This file serves two purposes:  
    1)  It imports every type that CS2HX generated.  haXe will ignore 
        any types that aren't used by haXe code, so this ensures haXe 
        compiles all of your code.

    2)  It lists all the static constructors.  haXe doesn't have the 
        concept of static constructors, so CS2HX generated cctor()
        methods.  You must call these manually.  If you call
        Constructors.init(), all static constructors will be called 
        at once.
*/
package ; 
import EnumExtensions;
import jint.DeclarationBindingType;
import jint.Engine;
import jint.EvalCodeScope;
import jint.native.argument.ArgumentsInstance;
import jint.native.array.ArrayConstructor;
import jint.native.array.ArrayInstance;
import jint.native.array.ArrayPrototype;
import jint.native.boolean.BooleanConstructor;
import jint.native.boolean.BooleanInstance;
import jint.native.boolean.BooleanPrototype;
import jint.native.date.DateConstructor;
import jint.native.date.DateInstance;
import jint.native.date.DatePrototype;
import jint.native.error.ErrorConstructor;
import jint.native.error.ErrorInstance;
import jint.native.error.ErrorPrototype;
import jint.native.functions.BindFunctionInstance;
import jint.native.functions.EvalFunctionInstance;
import jint.native.functions.FunctionConstructor;
import jint.native.functions.FunctionInstance;
import jint.native.functions.FunctionPrototype;
import jint.native.functions.FunctionShim;
import jint.native.functions.ScriptFunctionInstance;
import jint.native.functions.ThrowTypeError;
import jint.native.global.GlobalObject;
import jint.native.ICallable;
import jint.native.IConstructor;
import jint.native.IPrimitiveInstance;
import jint.native.json.JsonInstance;
import jint.native.json.JsonParser;
import jint.native.json.JsonParser_Extra;
import jint.native.json.JsonParser_Messages;
import jint.native.json.JsonParser_Token;
import jint.native.json.JsonParser_Tokens;
import jint.native.json.JsonSerializer;
import jint.native.JsValue;
import jint.native.JsValue_JsValueDebugView;
import jint.native.math.MathInstance;
import jint.native.Null;
import jint.native.number.NumberConstructor;
import jint.native.number.NumberInstance;
import jint.native.number.NumberPrototype;
import jint.native.object.ObjectConstructor;
import jint.native.object.ObjectInstance;
import jint.native.object.ObjectPrototype;
import jint.native.regexp.RegExpConstructor;
import jint.native.regexp.RegExpInstance;
import jint.native.regexp.RegExpPrototype;
import jint.native.string.StringConstructor;
import jint.native.string.StringInstance;
import jint.native.string.StringPrototype;
import jint.native.Undefined;
import jint.Options;
import jint.parser.ast.ArrayExpression;
import jint.parser.ast.AssignmentExpression;
import jint.parser.ast.AssignmentOperator;
import jint.parser.ast.BinaryExpression;
import jint.parser.ast.BinaryOperator;
import jint.parser.ast.BlockStatement;
import jint.parser.ast.BreakStatement;
import jint.parser.ast.CallExpression;
import jint.parser.ast.CatchClause;
import jint.parser.ast.ConditionalExpression;
import jint.parser.ast.ContinueStatement;
import jint.parser.ast.DebuggerStatement;
import jint.parser.ast.DoWhileStatement;
import jint.parser.ast.EmptyStatement;
import jint.parser.ast.Expression;
import jint.parser.ast.ExpressionStatement;
import jint.parser.ast.ForInStatement;
import jint.parser.ast.ForStatement;
import jint.parser.ast.FunctionDeclaration;
import jint.parser.ast.FunctionExpression;
import jint.parser.ast.Identifier;
import jint.parser.ast.IfStatement;
import jint.parser.ast.IPropertyKeyExpression;
import jint.parser.ast.LabelledStatement;
import jint.parser.ast.Literal;
import jint.parser.ast.LogicalExpression;
import jint.parser.ast.LogicalOperator;
import jint.parser.ast.MemberExpression;
import jint.parser.ast.NewExpression;
import jint.parser.ast.ObjectExpression;
import jint.parser.ast.Program;
import jint.parser.ast.Property;
import jint.parser.ast.PropertyKind;
import jint.parser.ast.RegExpLiteral;
import jint.parser.ast.ReturnStatement;
import jint.parser.ast.SequenceExpression;
import jint.parser.ast.Statement;
import jint.parser.ast.SwitchCase;
import jint.parser.ast.SwitchStatement;
import jint.parser.ast.SyntaxNode;
import jint.parser.ast.SyntaxNodes;
import jint.parser.ast.ThisExpression;
import jint.parser.ast.ThrowStatement;
import jint.parser.ast.TryStatement;
import jint.parser.ast.UnaryExpression;
import jint.parser.ast.UnaryOperator;
import jint.parser.ast.UpdateExpression;
import jint.parser.ast.VariableDeclaration;
import jint.parser.ast.VariableDeclarator;
import jint.parser.ast.WhileStatement;
import jint.parser.ast.WithStatement;
import jint.parser.Comment;
import jint.parser.FunctionScope;
import jint.parser.IFunctionDeclaration;
import jint.parser.IFunctionScope;
import jint.parser.IVariableScope;
import jint.parser.JavaScriptParser;
import jint.parser.JavaScriptParser_Extra;
import jint.parser.JavaScriptParser_LocationMarker;
import jint.parser.JavaScriptParser_ParsedParameters;
import jint.parser.JavaScriptParser_Regexes;
import jint.parser.Location;
import jint.parser.Messages;
import jint.parser.ParserException;
import jint.parser.ParserExtensions;
import jint.parser.ParserOptions;
import jint.parser.Position;
import jint.parser.State;
import jint.parser.Token;
import jint.parser.Tokens;
import jint.parser.VariableScope;
import jint.runtime.Arguments;
import jint.runtime.callstack.CallStackElementComparer;
import jint.runtime.callstack.JintCallStack;
import jint.runtime.CallStackElement;
import jint.runtime.Completion;
import jint.runtime.debugger.BreakPoint;
import jint.runtime.debugger.DebugHandler;
import jint.runtime.debugger.DebugInformation;
import jint.runtime.debugger.StepMode;
import jint.runtime.descriptors.PropertyDescriptor;
import jint.runtime.descriptors.specialized.ClrAccessDescriptor;
import jint.runtime.descriptors.specialized.FieldInfoDescriptor;
import jint.runtime.descriptors.specialized.IndexDescriptor;
import jint.runtime.descriptors.specialized.PropertyInfoDescriptor;
import jint.runtime.environments.Binding;
import jint.runtime.environments.DeclarativeEnvironmentRecord;
import jint.runtime.environments.EnvironmentRecord;
import jint.runtime.environments.ExecutionContext;
import jint.runtime.environments.LexicalEnvironment;
import jint.runtime.environments.ObjectEnvironmentRecord;
import jint.runtime.ExpressionInterpreter;
import jint.runtime.interop.ClrFunctionInstance;
import jint.runtime.interop.DefaultTypeConverter;
import jint.runtime.interop.DelegateWrapper;
import jint.runtime.interop.GetterFunctionInstance;
import jint.runtime.interop.IObjectConverter;
import jint.runtime.interop.IObjectWrapper;
import jint.runtime.interop.ITypeConverter;
import jint.runtime.interop.ObjectWrapper;
import jint.runtime.interop.SetterFunctionInstance;
import jint.runtime.interop.TypeReference;
import jint.runtime.JavaScriptException;
import jint.runtime.MruPropertyCache;
import jint.runtime.RecursionDepthOverflowException;
import jint.runtime.references.Reference;
import jint.runtime.StatementInterpreter;
import jint.runtime.StatementsCountOverflowException;
import jint.runtime.TypeConverter;
import jint.runtime.Types;
import jint.StrictModeScope;
import system.TimeSpan;
class Constructors
{
    public static function init()
    {
        TimeSpan.cctor();
        Arguments.cctor();
        CachedPowers.cctor();
        Completion.cctor();
        DateConstructor.cctor();
        DatePrototype.cctor();
        DefaultTypeConverter.cctor();
        EvalCodeScope.cctor();
        FastDtoaBuilder.cctor();
        GlobalObject.cctor();
        JavaScriptParser.cctor();
        JavaScriptParser_Regexes.cctor();
        JsValue.cctor();
        MathInstance.cctor();
        Messages.cctor();
        Null.cctor();
        PropertyDescriptor.cctor();
        StrictModeScope.cctor();
        Token.cctor();
        Undefined.cctor();
    }
}
