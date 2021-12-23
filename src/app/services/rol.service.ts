import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Rol } from '../models/rol';
import { RestService } from './rest-service.interface';
import { Config } from './config';

@Injectable()
export class RolService implements RestService {
    public url: string;
    public headers: HttpHeaders;

    constructor(
        private _http: HttpClient
    ) {
        this.url = Config.apiURL + 'roles';
        this.headers = new HttpHeaders().set('Content-Type', 'application/json');
    }

    save(model: Rol): Observable<any> {
        let params = JSON.stringify(model);
        return this._http.post(this.url, params, {headers: this.headers});
    }

    update(model: Rol): Observable<any> {
        let params = JSON.stringify(model);
        return this._http.put(this.url+'/'+model.id, params, {headers: this.headers});
    }

    delete(id: number): Observable<any> {
        return this._http.delete(this.url+'/'+id, {headers: this.headers});
    }

    getAll(): Observable<any> {
        return this._http.get(this.url, {headers: this.headers});
    }

    getById(id): Observable<any> {
        return this._http.get(this.url+'/'+id, {headers: this.headers});
    }
}