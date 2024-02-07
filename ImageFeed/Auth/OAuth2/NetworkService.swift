//
//  NetworkService.swift
//  ImageFeed
//
//  Created by Daria Lovkova on 24.12.2023.
//

import Foundation
enum NetworkError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
}

//protocol NetworkRouting {
//    func data(for: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
//}

final class NetworkService {
    private let urlSession = URLSession.shared

  

    func data(for request: URLRequest,
              completion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionTask {
        let handler: (Result<Data, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        let task = urlSession.dataTask(with: request, completionHandler: { data, response, error in
                    if let data = data,
                       let response = response,
                       let statusCode = (response as? HTTPURLResponse)?.statusCode
                    {
                        if 200 ..< 300 ~= statusCode {
                            handler(.success(data))
                        } else {
                            handler(.failure(NetworkError.httpStatusCode(statusCode)))
                        }
                    } else if let error = error {
                        handler(.failure(NetworkError.urlRequestError(error)))
                    } else {
                        handler(.failure(NetworkError.urlSessionError))
                    }
        })
        task.resume()
        return task
    }

    
    func decodeJson<T: Decodable>(type: T.Type, data: Data?) -> T? {
           guard let data = data else { return nil }

           do {
               return try JSONDecoder().decode(type, from: data)
           } catch let error {
               print("Couldn't decode data into \(error)")
               return nil
           }
       }
}
//
//    private func decodeJson (
//           for request: URLRequest,
//           completion: @escaping (Result<OAuthTokenResponseBody, Error>) -> Void
//       ) -> URLSessionTask {
//           let decoder = JSONDecoder()
//           return urlSession.data(for: request) { (result: Result<Data, Error>) in
//               let response = result.flatMap { data -> Result<OAuthTokenResponseBody, Error> in
//                   Result { try decoder.decode(OAuthTokenResponseBody.self, from: data) }
//   }
//               completion(response)
//           }
//   }
