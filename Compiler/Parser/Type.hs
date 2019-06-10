module Parser.Type where
import Parser.AST
import Text.ParserCombinators.Parsec 
import Control.Applicative ((<*), (*>), (<$>), (<*>))

{-

variable :: Parser Type -- String 
variable = do 
    fc  <- lexeme $ lowVar_Not_Key
    rest <- lexeme $ optionMaybe (tLambda <|> tApp)
    case rest of 
        Nothing -> return $ TVar fc
        Just rr -> return $ TLambda (TType fc []) rr

tuple:: Parser Type -- Type Type [Type] --8
tuple = do 
    _ <- lexeme $ char '(' 
    first <- lexeme $ type_
    _ <- lexeme $ char ',' 
    second <- lexeme $ type_
    cb2 <- optionMaybe $ lexeme $ char ',' 
    case cb2 of 
        Nothing -> do 
            _ <- lexeme $ char ')' 
            return $ TTuple first second []
        Just _ -> do 
            rest <- try $ sepBy type_ (lexeme $ char ',') 
            _ <- lexeme $ char ')' 
            return $ TTuple first second rest

tdataTypecell :: Parser (String,Type)
tdataTypecell = do 
    c <- lexeme $ lowVar
    _ <- lexeme $ char ':' 
    ex <- lexeme $ type_
    return (c,ex)



parent :: Parser Type -- [(String, Type)] 
parent = do 
    _ <- lexeme $ char '(' 
    mc <- lexeme $ type_
    _ <- lexeme $ char ')'
    return $ TList mc


tLambda :: Parser Type 
tLambda = do 
    _ <- lexeme $ string "->"
    ec <- lexeme $ type_
    return ec

tApp :: Parser Type 
tApp = do 
    _ <- lexeme $ string "->"
    ec <- lexeme $ type_
    return ec


tType :: Parser Type 
tType = do 
    name <- lexeme $ type_1
    --args <- lexeme $ many type_
    rest <- lexeme $ optionMaybe tLambda
    case rest of 
        Nothing -> return $ name
        Just rr -> return $ TLambda name rr

tTTypeQual  :: Parser Type    
tTTypeQual = do 
    name <- lexeme $ uppVar 
    args <- lexeme $ many type_
    return $ TTypeQual name args

type_1:: Parser Type 
type_1= try variable <|> tuple <|> record  <|> tLambda<|> tTTypeQual





    -}
tLambda_left:: Parser Type 
tLambda_left = do 
    _ <- lexeme $ string "->"
    ec <- lexeme $ (list <|>tuple <|> singleton)
    return ec


tLambda :: Parser Type 
tLambda = do 
    fir <- try $ (list <|>tuple  <|>singleton)
    snd <- try $ many1 tLambda_left
    return $ TLambda $ [fir] ++snd

list :: Parser Type -- [(String, Type)] 
list = do 
    _ <- lexeme $ char '[' 
    mc <- lexeme $ type_
    _ <- lexeme $ char ']'
    return $ TList mc

tuple:: Parser Type -- Type Type [Type] --8
tuple = do 
    _ <- lexeme $ char '(' 
    first <- lexeme $ type_
    _ <- lexeme $ char ',' 
    second <- lexeme $ type_
    cb2 <- optionMaybe $ lexeme $ char ',' 
    case cb2 of 
        Nothing -> do 
            _ <- lexeme $ char ')' 
            return $ TTuple first second []
        Just _ -> do 
            rest <- try $ sepBy type_ (lexeme $ char ',') 
            _ <- lexeme $ char ')' 
            return $ TTuple first second rest

variable :: Parser Type -- String 
variable = do 
    fc  <- name
    return $ TVar fc

int_type :: Parser Type 
int_type = do 
    _ <- string "Int"
    return $ TInt 
bool_type :: Parser Type 
bool_type = do 
    _ <- string "Bool"
    return $ TBool 
str_type :: Parser Type 
str_type = do 
    _ <- string "String"
    return $ TString 

unit_type :: Parser Type 
unit_type = do 
    _ <- string "()"
    return $ TUnit 

basicType :: Parser Type 
basicType = do
    basic <- try str_type <|> int_type  <|> bool_type <|> unit_type
    return basic

singleton :: Parser Type 
singleton = do
    li <- try $ many1 $ lexeme_spa (basicType <|> variable)
    case li of 
        [x] -> return x
        _ -> return $ TApp li

    

type_ :: Parser Type 
type_ = try  tLambda <|> list  <|>tuple <|> singleton


types_ :: Parser [Type]
types_ = spaces *> many (lexeme $ type_)

