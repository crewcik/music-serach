Option Explicit

Dim musicCollection
Set musicCollection = CreateObject("Scripting.Dictionary")

' Müzik ekleme fonksiyonu
Sub AddMusic(songName, artist, album)
    musicCollection.Add songName, Array(artist, album)
    WScript.Echo "Müzik başariyla eklendi: " & songName
End Sub

' Müzik silme fonksiyonu
Sub RemoveMusic(songName)
    If musicCollection.Exists(songName) Then
        musicCollection.Remove(songName)
        WScript.Echo "Müzik başariyla silindi: " & songName
    Else
        WScript.Echo "Müzik bulunamadi: " & songName
    End If
End Sub

' Tüm müzikleri listeleme fonksiyonu
Sub ListAllMusic()
    Dim songName
    For Each songName in musicCollection.Keys
        Dim details : details = musicCollection(songName)
        WScript.Echo "Şarki: " & songName & ", Sanatçi: " & details(0) & ", Albüm: " & details(1)
    Next
End Sub

' Müzik arama fonksiyonu
Sub SearchMusic(query)
    Dim songName
    Dim found : found = False
    For Each songName in musicCollection.Keys
        If InStr(1, songName, query, vbTextCompare) > 0 Then
            Dim details : details = musicCollection(songName)
            WScript.Echo "Şarki: " & songName & ", Sanatçi: " & details(0) & ", Albüm: " & details(1)
            found = True
        End If
    Next
    If Not found Then
        WScript.Echo "Müzik bulunamadi: " & query
    End If
End Sub

' Örnek kullanim
AddMusic "Şarki 1", "Sanatçi 1", "Albüm 1"
AddMusic "Şarki 2", "Sanatçi 2", "Albüm 2"
ListAllMusic()
SearchMusic "2"
RemoveMusic "Şarki 1"
ListAllMusic()
