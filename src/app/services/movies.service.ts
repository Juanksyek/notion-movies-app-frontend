import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MoviesService {
  private readonly apiUrl = 'http://localhost:3000/movies';

  constructor(private http: HttpClient) {}

  searchMovie(title: string): Observable<any> {
    return this.http.get(`${this.apiUrl}?title=${title}`);
  }
}
