kaydet=audiorecorder(8000,16,1);    %Nesne oluþturuldu.Burada 8000; hz cinsinden örnekleme frekansýný 8; bit sayýsýný 1; kanal sayýsýný gösterir.
recordblocking(kaydet,1);      %Mikrafon ile 1 saniye için kayýt yapýldý.
kaydedilen=getaudiodata(kaydet);   %kaydedilen ses sinyali sayýsal veri halinde depolanmýþ ve kaydedilen olarak atanmýþtýr.
Fs=8000;     %ses kartýmýzýn desteklediði örnekleme frekansý 8000 olduðu için Fs 8000 olarak seçilmiþtir.
L=length(kaydedilen);     %sayýsal veri haline dönüþtürülmüþ ses sinyalinin uzunluðu belirlenmiþtir.
NFFT=2^nextpow2(L); %nextpow2 ile sinyal gücünün 2 olmadýðý durumlarda fftsi alýnan sinyalin performansýný arttýrmak için kullanýlmýþtýr.
Y=fft(kaydedilen,NFFT)/L;  %fourier transform alýnarak y deðiþkenine atanmýþtýr.
f1=Fs/2*linspace(0,1,NFFT/2+1); %(NFFT/2+1) aralýklý satýr vektörü oluþturulmuþtur.
f=round(f1);  %round ile frekans deðeri en yakýn tamsayýya yuvarlanmýþtýr.
[C,I]=max(abs(Y(1:NFFT/2+1)));  %mutlak deðer alýnmýþtýr.
bulunanfrekans=f(I)   %frekans deðeri elde edilmiþtir.

if(31<bulunanfrekans && bulunanfrekans<35 || 63<bulunanfrekans && bulunanfrekans<67 || 126<bulunanfrekans && bulunanfrekans<134 || 251<bulunanfrekans && bulunanfrekans<268||2*251<bulunanfrekans && bulunanfrekans<2*268||4*251<bulunanfrekans && bulunanfrekans<4*268    )
    fprintf('bulunan nota: C')

elseif(36<bulunanfrekans && bulunanfrekans<39 || 72<bulunanfrekans && bulunanfrekans<75 || 142<bulunanfrekans && bulunanfrekans<149 ||  284<bulunanfrekans && bulunanfrekans<298 || 2*284<bulunanfrekans && bulunanfrekans<2*298 || 4*284<bulunanfrekans && bulunanfrekans<4*298)
    fprintf('bulunan nota: D')

elseif(40<bulunanfrekans && bulunanfrekans<42 || 81<bulunanfrekans && bulunanfrekans<85 || 160<bulunanfrekans && bulunanfrekans<168 || 317<bulunanfrekans && bulunanfrekans<336 || 2*317<bulunanfrekans && bulunanfrekans<2*336 || 4*317<bulunanfrekans && bulunanfrekans<4*336)
    fprintf('bulunan nota: E')

elseif(43<bulunanfrekans && bulunanfrekans<47 || 86<bulunanfrekans && bulunanfrekans<90 || 169<bulunanfrekans && bulunanfrekans<178||337<bulunanfrekans && bulunanfrekans<355||2*337<bulunanfrekans && bulunanfrekans<2*355 || 4*337<bulunanfrekans && bulunanfrekans<4*355)
    fprintf('bulunan nota: F')

elseif(48<bulunanfrekans && bulunanfrekans<53 || 96<bulunanfrekans && bulunanfrekans<100 || 189<bulunanfrekans && bulunanfrekans<198 || 378<bulunanfrekans && bulunanfrekans<399 || 2*378<bulunanfrekans && bulunanfrekans<2*399 || 4*378<bulunanfrekans && bulunanfrekans<4*399    )
    fprintf('bulunan nota: G')

elseif(54<bulunanfrekans && bulunanfrekans<59 ||108<bulunanfrekans && bulunanfrekans<113||214<bulunanfrekans && bulunanfrekans<226||424<bulunanfrekans && bulunanfrekans<457 || 2*424<bulunanfrekans && bulunanfrekans<2*457 || 4*424<bulunanfrekans && bulunanfrekans<4*457)
    fprintf('bulunan nota: A')

elseif(60<bulunanfrekans && bulunanfrekans<62 || 120<bulunanfrekans && bulunanfrekans<125 ||239<bulunanfrekans && bulunanfrekans<250 || 477<bulunanfrekans && bulunanfrekans<500 || 2*477<bulunanfrekans && bulunanfrekans<2*500 || 4*477<bulunanfrekans && bulunanfrekans<4*500   )
    fprintf('bulunan nota: B')
else
    fprintf('Tekrar Deneyiniz')
end


periyot=1/bulunanfrekans %periyot hesaplandý.
disp('varyans');
var(kaydedilen)%varyans alma uygulandý.
disp('standart sapma');
std(kaydedilen)%standart sapma alma iþlemi uygulandý.,
hist(kaydedilen);title('Kaydedilen Sinyalin Histogramý'); %histogram alma iþlemi uygulandý.
figure;
t=(0:length(kaydedilen)-1)/Fs; % t=nT zaman
plot(1000*t,kaydedilen), xlabel('Time (ms)');ylabel('Genlik');title('Bulunan Frekans');




