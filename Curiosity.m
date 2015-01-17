function varargout = Curiosity(varargin)
% CURIOSITY M-file for Curiosity.fig
%      CURIOSITY, by itself, creates a new CURIOSITY or raises the existing
%      singleton*.
%
%      H = CURIOSITY returns the handle to a new CURIOSITY or the handle to
%      the existing singleton*.
%
%      CURIOSITY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CURIOSITY.M with the given input arguments.
%
%      CURIOSITY('Property','Value',...) creates a new CURIOSITY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Curiosity_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      reset.  All inputs are passed to Curiosity_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Curiosity

% Last Modified by GUIDE v2.5 17-Jan-2015 21:23:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Curiosity_OpeningFcn, ...
                   'gui_OutputFcn',  @Curiosity_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Curiosity is made visible.
function Curiosity_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Curiosity (see VARARGIN)

% Choose default command line output for Curiosity
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Curiosity wait for user response (see UIRESUME)
% uiwait(handles.figure1);
imshow('pia16207-43.jpg')


% --- Outputs from this function are returned to the command line.
function varargout = Curiosity_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Main code excutes on button press
% Zamiany w GUI po uruchomieniu
set(handles.start,'BackgroundColor','green');
set(handles.start,'Enable','off')
% Wybieranie drogi jaka bedze przemieszczac sie probka
if handles.manual == 1
    wybor1 = menu('Wybierz cel pr�bki','SAM1','SAM2','CHEMIN','TACKA')  
    switch wybor1
        case 1
            wybor1 = menu('Wybierz rozmiar pr�bki','Sito 1mm','Sito 1 mikro metr') 
            if wybor1 == 2
                wybor1 = menu('Wybierz �r�d�o pr�bki','�y�ka','Wiert�o') 
            end
        case 2
            wybor1 = menu('Wybierz rozmiar pr�bki','Sito 1mm','Sito 1 mikro metr') 
            if wybor1 == 2
                wybor1 = menu('Wybierz �r�d�o pr�bki','�y�ka','Wiert�o') 
            end
        case 3
            wybor1 = menu('Wybierz �r�d�o pr�bki','�y�ka','Wiert�o') 
        case 4
            wybor1 = menu('Wybierz �r�d�o pr�bki','�y�ka','Wiert�o') 
    end    
else 
    set(handles.manual,'Enable','off')
    set(handles.slider1,'Enable','off')
    %Wybiera automatycznie droge
end
order = 0
while 1
    switch order
        case 0 % Przygotowanie komponentow
            order = 1
        case 1 % Lyzka
            set(handles.lyzka,'BackgroundColor','green');
            if rand <= 0.2
                order = 0
                set(handles.awaria,'BackgroundColor','red');
                set(handles.opis,'string','�y�ka nie mo�e pobra� materia�u!');
                pause(1)
                set(handles.rozwiazanie,'string','W przeciagu 3 sekund nastapi ponowne pobranie materialu');
                pause(3)
                set(handles.awaria,'BackgroundColor','default');
                set(handles.opis,'string','');
                set(handles.rozwiazanie,'string','');
            end
            pause(3)
            set(handles.lyzka,'BackgroundColor','default');
            order = 3
        case 2 % Wiertlo
            %pobieranie danych xD
        case 3 % Przemieszenie
            set(handles.wibracje,'BackgroundColor','green');
            if rand <= 0.2
                order = 0
                set(handles.awaria,'BackgroundColor','red');
                set(handles.opis,'string','Pr�bka jest zbyt du�a. Nie mie�ci si� w kanale transportowym.');
                pause(1)
                set(handles.rozwiazanie,'string','W przeciagu 3 sekund nastapi usuni�cie pr�bki i pobranie na nowo.');
                pause(3)
                set(handles.awaria,'BackgroundColor','default');
                set(handles.opis,'string','');
                set(handles.rozwiazanie,'string','');
            end
            pause(3)
            set(handles.wibracje,'BackgroundColor','default');
        case 4 % Sito1mm
            set(handles.rozdrabniacz,'BackgroundColor','green');
             if probka <= 1
                set(handles.awaria,'BackgroundColor','red');
                set(handles.opis,'string','Pr�bka jest zbyt du�a. Nie mozna przesiac przez sito.');
                pause(1)
                set(handles.rozwiazanie,'string','W przeciagu 3 sekund nastapi przekazanie probki do rozdrabniania.');
                pause(3)
                set(handles.awaria,'BackgroundColor','default');
                set(handles.opis,'string','');
                set(handles.rozwiazanie,'string','');
                pause(1)
                set(handles.rozdrabniacz,'BackgroundColor','green');
                pause(3)
                set(handles.rozdrabniacz,'BackgroundColor','red');
             end
        case 5 % Sito1 mikro metr
        case 6 % Przemieszczenie
            set(handles.wibracje,'BackgroundColor','green');
             if rand <= 0.2
                order = 0
                set(handles.awaria,'BackgroundColor','red');
                set(handles.opis,'string','Pr�bka jest zbyt du�a. Nie mie�ci si� w kanale transportowym.');
                pause(1)
                set(handles.rozwiazanie,'string','W przeciagu 3 sekund nastapi usuni�cie pr�bki i pobranie na nowo.');
                pause(3)
                set(handles.awaria,'BackgroundColor','default');
                set(handles.opis,'string','');
                set(handles.rozwiazanie,'string','');
             end
            set(handles.wibracje,'BackgroundColor','default');
        case 7 % Formowanie porcji
            
        case 8 % Przemieszczenie
            set(handles.wibracje,'BackgroundColor','green');
            
            set(handles.wibracje,'BackgroundColor','default');
        case 9 % Sam1
            break;
        case 10 % Sam2
            break;
        case 11 % chemin
            break;
        case 12 % tacka
            break;
    end
end



function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject,'Value') == 1 % 1/0 when pressed
    set(handles.start,'BackgroundColor','default');
    set(handles.start,'Enable','on')
    set(handles.slider1,'Enable','on')
    set(handles.manual,'Enable','on')
end
% --- Executes on button press in manual.
function manual_Callback(hObject, eventdata, handles)
% hObject    handle to manual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of manual

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.manual = 1;
else
	handles.manual = 0;
end
guidata(hObject, handles)

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in awaria.
function awaria_Callback(hObject, eventdata, handles)
% hObject    handle to awaria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in moduly.
function moduly_Callback(hObject, eventdata, handles)
% hObject    handle to moduly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns moduly contents as cell array
%        contents{get(hObject,'Value')} returns selected item from moduly


% --- Executes during object creation, after setting all properties.
function moduly_CreateFcn(hObject, eventdata, handles)
% hObject    handle to moduly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in lyzka.
function lyzka_Callback(hObject, eventdata, handles)
% hObject    handle to lyzka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in wibracje.
function wibracje_Callback(hObject, eventdata, handles)
% hObject    handle to wibracje (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rozdrabniacz.
function rozdrabniacz_Callback(hObject, eventdata, handles)
% hObject    handle to rozdrabniacz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in porcjowanie.
function porcjowanie_Callback(hObject, eventdata, handles)
% hObject    handle to porcjowanie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tacka.
function tacka_Callback(hObject, eventdata, handles)
% hObject    handle to tacka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in chemin.
function chemin_Callback(hObject, eventdata, handles)
% hObject    handle to chemin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sam1.
function sam1_Callback(hObject, eventdata, handles)
% hObject    handle to sam1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sam2.
function sam2_Callback(hObject, eventdata, handles)
% hObject    handle to sam2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in przemieszczanie.
function przemieszczanie_Callback(hObject, eventdata, handles)
% hObject    handle to przemieszczanie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in zamknij.
function zamknij_Callback(hObject, eventdata, handles)
% hObject    handle to zamknij (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tytul = 'Pytanie:';
wynik = questdlg('Na pewno chcesz opuscic program?',tytul,'Tak','Nie','Nie');
if strcmp(wynik,'Tak')
   close(gcf);
end;


% --- Executes on key press with focus on reset and none of its controls.
function reset_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


