#=====================================================
#Makfile padrão basico para projetos em C/C++
#
#Flags:
#	CC*: Compilador utilizado
#	CFLAGS: Flags do compilador
#	LFLAGS: Flags do linker
#	APP*: Nome do aplicativo
#	FONTES*: Lista de arquivos fontes do projeto
#* = Preenchimento obrigatório
#
#	~GBecker
#	02/01/2015
#=====================================================
CC =
CFLAGS =
LFLAGS =
#=====================================================
APP =
SRC_DIR = src
INC_DIR = $(SRC_DIR)/inc
OBJ_DIR = obj
BIN_DIR = bin
EXT = cpp
#=====================================================
FONTES =
TEMP = $(subst $(SRC_DIR),$(OBJ_DIR),$(FONTES))	# Auxiliar
OBJETOS = $(TEMP:.$(EXT)=.o)					# Arquivos Objeto
#=====================================================

$(APP) : $(OBJETOS)
	@echo Linking...
	@$(CC) -o $(BIN_DIR)/$(APP) $(OBJETOS) $(LFLAGS)
	@echo Built successfully!

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.$(EXT)
	@echo Build $<...
	@$(CC) $(CFLAGS) -I$(INC_DIR) -o $@ -c $<

build b : $(OBJETOS)

list l : 
	@echo Arquivos fonte do projeto:
	@ls -l $(SRC_DIR)
	@echo Arquivos de cabeçalho do projeto:
	@ls -l $(INC_DIR)

clean c : 
	@echo Cleaning...
	@rm -rf $(OBJ_DIR)/*.o
	@rm -rf $(BIN_DIR)/$(APP)

init i :
	@echo Criando o diretorio $(SRC_DIR)
	@mkdir $(SRC_DIR)
	@echo Criando o diretorio $(INC_DIR)
	@mkdir $(INC_DIR)
	@echo Criando o diretorio $(OBJ_DIR)
	@mkdir $(OBJ_DIR)
	@echo Criando o diretorio $(BIN_DIR)
	@mkdir $(BIN_DIR)

debug d :
	@echo Executando $(BIN_DIR)/$(APP) em modo debug
	@gdb $(BIN_DIR)/$(APP)

release r :
	@echo Executando $(BIN_DIR)/$(APP) em modo release
	@./$(BIN_DIR)/$(APP)

