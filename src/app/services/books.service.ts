import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BooksService {
  private readonly apiUrl = 'http://localhost:3000/books';

  constructor(private http: HttpClient) {}

  searchBook(title: string): Observable<any> {
    return this.http.get(`${this.apiUrl}?title=${title}`);
  }
}
